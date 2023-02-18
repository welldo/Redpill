## atlantic  
>description: Marvell (Aquantia) Corporation(R) Network Driver  
>depends: crc-itu-t  
## tg3  
>description: Broadcom Tigon3 ethernet driver  
>depends: libphy  
## mptspi  
>description: Fusion MPT SPI Host driver  
>depends: mptscsih,mptbase,scsi_transport_spi  
## ixgbe  
>description: Intel(R) 10GbE PCI Express Linux Network Driver  
>depends: dca,vxlan  
## cxgb3  
>description: Chelsio T3 Network Driver  
>depends: mdio  
## virtio_pci  
>description: virtio-pci  
## nct6775  
>description: Driver for NCT6775F and compatible chips  
>depends: hwmon-vid  
## xhci-hcd  
>description: 'eXtensible' Host Controller (xHC) Driver  
## ixgbevf  
>description: Intel(R) 10 Gigabit Virtual Function Network Driver  
## vesafb  
>description: null  
## uhci-hcd  
>description: USB Universal Host Controller Interface driver  
>depends: usbcore  
## megaraid_mm  
>description: LSI Logic Management Module  
## sr_mod  
>description: SCSI cdrom (sr) driver  
## font  
>description: Console Fonts  
## mptbase  
>description: Fusion MPT base driver  
## sdhci  
>description: Secure Digital Host Controller Interface core driver  
>depends: mmc_core  
## sky2  
>description: Marvell Yukon 2 Gigabit Ethernet driver  
## cfbcopyarea  
>description: Generic software accelerated copyarea  
## processor  
>description: ACPI Processor Driver  
## softcursor  
>description: Generic software cursor  
>depends: fb  
## auxiliary  
>description: Auxiliary Bus Standalone  
## e1000  
>description: Intel(R) PRO/1000 Network Driver  
## virtio_input  
>description: Virtio input device driver  
>depends: virtio,virtio_ring  
## atlantic_v2  
>description: Marvell (Aquantia) Corporation(R) Network Driver  
>depends: crc-itu-t  
## cfbfillrect  
>description: Generic software accelerated fill rectangle  
## be2net  
>description: Emulex OneConnect NIC Driver 11.1.38.64  
>depends: vxlan  
## mlx4_en  
>description: Mellanox ConnectX HCA Ethernet driver  
>depends: mlx4_core,mlx_compat,vxlan  
## r8152  
>description: Realtek RTL8152/RTL8153 Based USB Ethernet Adapters  
>depends: usbcore  
## mlx4_core  
>description: Mellanox ConnectX HCA low-level driver  
>depends: mlx_compat  
## mlx5_ib  
>description: Mellanox Connect-IB HCA IB driver  
>depends: mlx5_core,ib_core,mlx_compat  
## vga16fb  
>description: Legacy VGA framebuffer device driver  
>depends: cfbfillrect,cfbimgblt,cfbcopyarea,fb,vgastate  
## mpt3sas  
>description: LSI MPT Fusion SAS 3.0 & SAS 3.5 Device Driver  
>depends: scsi_transport_sas,raid_class  
## skge  
>description: SysKonnect Gigabit Ethernet driver  
## dvb-usb-dvbsky  
>description: Driver for DVBSky USB  
>depends: dvb_usb_v2,dvb-core,usbcore,rc-core,m88ds3103  
## cdc_ncm  
>description: USB CDC NCM host driver  
>depends: usbnet,usbcore  
## fb  
>description: null  
## cpufreq_performance  
>description: CPUfreq policy governor 'performance'  
## mptctl  
>description: Fusion MPT misc device (ioctl) driver  
>depends: mptbase  
## si2157  
>description: Silicon Labs Si2146/2147/2148/2157/2158 silicon tuner driver  
## jme  
>description: JMicron JMC2x0 PCI Express Ethernet driver  
>depends: mii  
## fbdev  
>description: null  
## rc-core  
>description: null  
## alx  
>description: Qualcomm Atheros(R) AR816x/AR817x PCI-E Ethernet Network Driver  
>depends: mdio  
## r8169  
>description: RealTek RTL-8169 Gigabit Ethernet driver  
>depends: mii  
## aqc111  
>description: Aquantia AQtion USB to 5/2.5GbE Controllers  
>depends: usbnet,usbcore  
## qla2xxx  
>description: QLogic Fibre Channel HBA Driver  
>depends: scsi_transport_fc  
## vmxnet3  
>description: VMware vmxnet3 virtual NIC driver  
## crc-itu-t  
>description: CRC ITU-T V.41 calculations  
## megaraid_mbox  
>description: LSI Logic MegaRAID Mailbox Driver  
>depends: megaraid_mm  
## virtio  
>description: null  
## atl1c  
>description: Qualcomm Atheros 100/1000M Ethernet Network Driver  
## mdio  
>description: Generic support for MDIO-compatible transceivers  
## fbcon  
>depends: fb,font,bitblit  
## bitblit  
>description: Bit Blitting Operation  
>depends: fb,softcursor  
## b44  
>description: Broadcom 44xx/47xx 10/100 PCI ethernet driver  
>depends: ssb,libphy,mii  
## mlxsw_pci  
>description: Mellanox switch PCI interface driver  
>depends: mlxsw_core  
## m88ds3103  
>description: Montage Technology M88DS3103 DVB-S/S2 demodulator driver  
>depends: regmap-i2c,dvb-core  
## dvb-core  
>description: DVB Core Driver  
## r8125  
>description: Realtek RTL8125 2.5Gigabit Ethernet driver  
## mmc_core  
>description: null  
## ts2020  
>description: Montage Technology TS2020 - Silicon tuner driver module  
>depends: regmap-i2c  
## atl1e  
>description: Atheros 1000M Ethernet Network Driver  
## mlx_compat  
>description: Kernel backport module  
## etxhci-hcd  
>description: 'eXtensible' Host Controller (xHC) Driver  
>depends: usbcore  
## crc-ccitt  
>description: CRC-CCITT calculations  
## libphy  
>description: PHY library  
## cpufreq_conservative  
>description: 'cpufreq_conservative' - A dynamic cpufreq governor for Low Latency Frequency Transition capable processors optimised for use in a battery environment  
## vmw_pvscsi  
>description: VMware PVSCSI driver  
## ushc  
>description: USB SD Host Controller driver  
>depends: usbcore,mmc_core  
## sp2  
>description: CIMaX SP2/HF CI driver  
>depends: dvb-core  
## r8168  
>description: RealTek RTL-8168 Gigabit Ethernet driver  
## i8042  
>description: i8042 keyboard and mouse controller driver  
## cxgb4  
>description: Chelsio T4/T5/T6 Network Driver  
## syscopyarea  
>description: Generic copyarea (sys-to-sys)  
## e1000e  
>description: Intel(R) PRO/1000 Network Driver  
## si2168  
>description: Silicon Labs Si2168 DVB-T/T2/C demodulator driver  
## mii  
>description: MII hardware support library  
## mlx5_core  
>description: Mellanox Connect-IB, ConnectX-4, ConnectX-5 core driver  
>depends: mlx_compat,vxlan  
## xhci-pci  
>description: xHCI PCI Host Controller Driver  
## button  
>description: ACPI Button Driver  
## dvb-usb  
>description: A library module containing commonly used USB and DVB function USB DVB devices  
>depends: rc-core,dvb-core,usbcore  
## scsi_transport_spi  
>description: SPI Transport Attributes  
## igc  
>description: Intel(R) 2.5G Ethernet Linux Driver  
## virtio_net  
>description: Virtio network driver  
>depends: virtio,virtio_ring  
## igb  
>description: Intel(R) Gigabit Ethernet Linux Driver  
>depends: dca  
## mptscsih  
>description: Fusion MPT SCSI Host driver  
>depends: mptbase  
## sysimgblt  
>description: 1-bit/8-bit to 1-32 bit color expansion (sys-to-sys)  
## 8139cp  
>description: RealTek RTL-8139C+ series 10/100 PCI Ethernet driver  
>depends: mii  
## ice  
>description: Intel(R) Ethernet Connection E800 Series Linux Driver  
>depends: vxlan,auxiliary  
## cpufreq_ondemand  
>description: 'cpufreq_ondemand' - A dynamic cpufreq governor for Low Latency Frequency Transition capable processors  
## atkbd  
>description: AT and PS/2 keyboard driver  
## virtio_scsi  
>description: Virtio SCSI HBA driver  
>depends: virtio,virtio_ring  
## mmc_block  
>description: Multimedia Card (MMC) block device driver  
>depends: mmc_core  
## bnx2x  
>description: QLogic BCM57710/57711/57711E/57712/57712_MF/57800/57800_MF/57810/57810_MF/57840/57840_MF Driver  
>depends: mdio,vxlan  
## efifb  
>depends: cfbimgblt,cfbcopyarea,cfbfillrect,fb  
## virtio_ring  
>description: null  
## i2c-algo-bit  
>description: I2C-Bus bit-banging algorithm  
## cxgb4vf  
>description: Chelsio T4/T5/T6 Virtual Function (VF) Network Driver  
## megaraid_sas  
>description: Avago MegaRAID SAS Driver  
## virtio_mmio  
>description: Platform bus driver for memory mapped virtio devices  
## cfbimgblt  
>description: Generic software accelerated imaging drawing  
## mlxsw_core  
>description: Mellanox switch device core driver  
## vub300  
>description: VUB300 USB to SD/MMC/SDIO adapter driver  
>depends: usbcore,mmc_core  
## via-sdmmc  
>description: VIA SD/MMC Card Interface driver  
>depends: mmc_core  
## iavf  
>description: Intel(R) Ethernet Adaptive Virtual Function Driver  
>depends: auxiliary  
## thermal  
>description: ACPI Thermal Zone Driver  
>depends: thermal_sys  
## acpi-cpufreq  
>description: ACPI Processor P-States Driver  
## fb_sys_fops  
>description: Generic file read (fb in system RAM)  
## ixgb  
>description: Intel(R) PRO/10GbE Network Driver  
## dvb_usb_v2  
>description: DVB USB common  
>depends: rc-core,dvb-core,usbcore  
## hid-generic  
>description: HID generic driver  
>depends: hid  
## intel_auxiliary  
>description: Auxiliary Bus Standalone  
## dvb-usb-dib0700  
>description: Driver for devices based on DiBcom DiB0700 - USB bridge  
>depends: dib7000m,dib9000,dibx000_common,dvb-usb,dib0090,dib0070,dib3000mc,usbcore,rc-core  
## igbvf  
>description: Intel(R) Gigabit Virtual Function Network Driver  
## vgastate  
>description: VGA State Save/Restore  
## bnxt_en  
>description: Broadcom BCM573xx network driver  
>depends: vxlan  
## mtk-sd  
>description: MediaTek SD/MMC Card Driver  
>depends: mmc_core  
## mlx4_ib  
>description: Mellanox ConnectX HCA InfiniBand driver  
>depends: mlx4_core,mlx_compat,ib_core  
## sysfillrect  
>description: Generic fill rectangle (sys-to-sys)  
## cxgb  
>description: Chelsio 10Gb Ethernet Driver  
>depends: mdio  
## i40e  
>description: Intel(R) 40-10 Gigabit Ethernet Connection Network Driver  
>depends: vxlan  
## mptsas  
>description: Fusion MPT SAS Host driver  
>depends: mptscsih,mptbase  
## cdrom  
>description: null  
## scsi_transport_sas  
>description: SAS Transport Attributes  
## drm_kms_helper  
>description: DRM KMS helper  
>depends: drm,fb,fb_sys_fops,cfbfillrect,syscopyarea,cfbimgblt,sysfillrect,sysimgblt,cfbcopyarea  
## generic_bl  
>description: Generic Backlight Driver  
>depends: backlight  
## libsas  
>description: SAS Transport Layer  
>depends: scsi_transport_sas  
## ehci-hcd  
>description: USB 2.0 'Enhanced' Host Controller (EHCI) Driver  
>depends: usbcore  
## cpufreq_governor  
>description: null  
## drm_panel_orientation_quirks  
>description: null  
## bnx2  
>description: QLogic BCM5706/5708/5709/5716 Driver  
## backlight  
>description: Backlight Lowlevel Control Abstraction  
## video  
>description: ACPI Video Driver  
>depends: backlight  
## hwmon-vid  
>description: hwmon-vid driver  
## i915  
>description: Intel Graphics  
>depends: drm_kms_helper,drm,iosf_mbi,backlight,video,fb,button,i2c-algo-bit  
## iosf_mbi  
>description: IOSF Mailbox Interface accessor  
## rtc-cmos  
>description: Driver for PC-style 'CMOS' RTCs  
## drm  
>description: DRM panel infrastructure  
>depends: drm_panel_orientation_quirks  
## ehci-pci  
>description: EHCI PCI platform driver  
>depends: usbcore,ehci-hcd  
## raid_class  
>description: RAID device class  
## nvidia  
>description: null  
## nvidia-uvm  
>depends: nvidia  
## mpt2sas  
>description: LSI MPT Fusion SAS 2.0 Device Driver  
## usbip-host  
>description: USB/IP Host Driver  
>depends: usbip-core,usbcore  
## usb-storage  
>description: USB Mass Storage driver for Linux  
>depends: usbcore  
## blk-mq-virtio  
>description: null  
## usbserial  
>description: USB Serial Driver core  
>depends: usbcore  
## failover  
>description: Generic failover infrastructure/interface  
## usbhid  
>description: USB HID core driver  
>depends: hid,usbcore  
## virtio_blk  
>description: Virtio block driver  
>depends: virtio,virtio_ring,blk-mq-virtio  
## mdio_devres  
>description: null  
## usbcore  
>description: null  
## net_failover  
>description: Failover driver for Paravirtual drivers  
>depends: failover  
## usb-common  
>description: null  
## r8153_ecm  
>description: Realtek USB ECM device  
>depends: cdc_ether,usbnet,usbcore  
## usbnet  
>description: USB network driver framework  
>depends: usbcore,mii  
## usbip-core  
>description: USB/IP Core  
>depends: usb-common  
## amd-xgbe  
>description: AMD 10 Gigabit Ethernet Driver  
## marvell10g  
>description: Marvell Alaska X 10Gigabit Ethernet PHY driver (MV88X3310)  
## mptlan  
>description: Fusion MPT LAN driver  
>depends: mptbase  
