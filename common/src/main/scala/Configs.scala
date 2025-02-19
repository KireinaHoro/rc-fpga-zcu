package zynq

import chisel3._
import freechips.rocketchip.config.{Parameters, Config}
import freechips.rocketchip.subsystem._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.devices.tilelink.BootROMParams
import freechips.rocketchip.rocket.{RocketCoreParams, MulDivParams, DCacheParams, ICacheParams}
import freechips.rocketchip.tile.{RocketTileParams, BuildCore, XLen}
import testchipip._

class WithBootROM extends Config((site, here, up) => {
  case BootROMParams => BootROMParams(
    contentFileName = s"../testchipip/bootrom/bootrom.rv${site(XLen)}.img")
})

//TODO TUO look into zynq adapter
class WithZynqAdapter extends Config((site, here, up) => {
  case SerialFIFODepth => 16
  case ResetCycles => 10
  case ZynqAdapterBase => BigInt(0xA0000000L)
  case ExtMem => up(ExtMem, site).copy(idBits = 6, size = x"8000_0000")
  case ExtBus => up(ExtBus, site).copy(idBits = 6)
  case ExtIn => up(ExtIn, site).copy(beatBytes = 4, idBits = 12)
  case BlockDeviceKey => BlockDeviceConfig(nTrackers = 2)
  case BlockDeviceFIFODepth => 16
  case NetworkFIFODepth => 16
  case NExtTopInterrupts => 3
})

class WithNMediumCores(n: Int) extends Config((site, here, up) => {
  case RocketTilesKey => {
    val medium = RocketTileParams(
      core = RocketCoreParams(fpu = None),
      btb = None,
      dcache = Some(DCacheParams(
        rowBits = site(SystemBusKey).beatBytes*8,
        nSets = 64,
        nWays = 1,
        nTLBEntries = 4,
        nMSHRs = 0,
        blockBytes = site(CacheBlockBytes))),
      icache = Some(ICacheParams(
        rowBits = site(SystemBusKey).beatBytes*8,
        nSets = 64,
        nWays = 1,
        nTLBEntries = 4,
        blockBytes = site(CacheBlockBytes))))
    List.tabulate(n)(i => medium.copy(hartId = i))
  }
})

class DefaultConfig extends Config(
  new WithBootROM ++ new freechips.rocketchip.system.DefaultConfig)
class DefaultMediumConfig extends Config(
  new WithBootROM ++ new WithNMediumCores(1) ++
  new freechips.rocketchip.system.BaseConfig)
class DefaultQuadBigConfig extends Config(
  new WithBootROM ++ new WithNBigCores(4) ++
  new freechips.rocketchip.system.DefaultConfig)
  //new freechips.rocketchip.system.DefaultSmallConfig)
class DefaultSmallConfig extends Config(
  new WithBootROM ++ new freechips.rocketchip.system.DefaultSmallConfig)

class ZynqConfig extends Config(new WithZynqAdapter ++ new DefaultConfig)
class ZynqMediumConfig extends Config(new WithZynqAdapter ++ new DefaultMediumConfig)
class ZynqSmallConfig extends Config(new WithZynqAdapter ++ new DefaultSmallConfig)
class ZynqQuadConfig extends Config(new WithZynqAdapter ++ new DefaultQuadBigConfig)

class ZynqFPGAConfig extends Config(new WithoutTLMonitors ++ new ZynqConfig)
class ZynqMediumFPGAConfig extends Config(new WithoutTLMonitors ++ new ZynqMediumConfig)
class ZynqSmallFPGAConfig extends Config(new WithoutTLMonitors ++ new ZynqSmallConfig)

