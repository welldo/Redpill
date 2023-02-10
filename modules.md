## mpt3sas  
>description: LSI MPT Fusion SAS 3.0 Device Driver  
>depends: scsi_transport_sas  
## be2net  
>description: Emulex OneConnect NIC Driver  
>depends: vxlan  
## virtio_input  
>description: Virtio input device driver  
>depends: virtio,virtio_ring  
## xhci-pci  
>description: xHCI PCI Host Controller Driver  
## usbhid  
>description: USB HID core driver  
>depends: hid,usbcore  
## virtio_pci  
>description: virtio-pci  
## r8169  
>description: RealTek RTL-8169 Gigabit Ethernet driver  
>depends: libphy,mdio_devres  
## mlx5_ib  
>description: Mellanox 5th generation network adapters (ConnectX series) IB driver  
>depends: mlx5_core,ib_core  
## atlantic_v2  
>description: Marvell (Aquantia) Corporation(R) Network Driver  
>depends: crc-itu-t  
## virtio_mmio  
>description: Platform bus driver for memory mapped virtio devices  
## r8168  
>description: RealTek RTL-8168 Gigabit Ethernet driver  
## igb  
>description: Intel(R) Gigabit Ethernet Linux Driver  
>depends: dca  
## failover  
>description: Generic failover infrastructure/interface  
## cfbimgblt  
>description: Generic software accelerated imaging drawing  
## usb-storage  
>description: USB Mass Storage driver for Linux  
>depends: usbcore  
## mdio  
>description: Generic support for MDIO-compatible transceivers  
## cdc_ncm  
>description: USB CDC NCM host driver  
>depends: usbnet,cdc_ether,usbcore  
## mdio_devres  
>description: null  
## virtio  
>description: null  
## ixgbevf  
>description: Intel(R) 10 Gigabit Virtual Function Network Driver  
## ixgbe  
>description: Intel(R) 10GbE PCI Express Linux Network Driver  
>depends: dca,vxlan  
## ixgb  
>description: Intel(R) PRO/10GbE Network Driver  
## xhci-hcd  
>description: 'eXtensible' Host Controller (xHC) Driver  
## igc  
>description: Intel(R) 2.5G Ethernet Linux Driver  
## usbserial  
>description: USB Serial Driver core  
>depends: usbcore  
## i40e  
>description: Intel(R) 40-10 Gigabit Ethernet Connection Network Driver  
>depends: intel_auxiliary  
## i2c-algo-bit  
>description: I2C-Bus bit-banging algorithm  
## net_failover  
>description: Failover driver for Paravirtual drivers  
>depends: failover  
## alx  
>description: Qualcomm Atheros(R) AR816x/AR817x PCI-E Ethernet Network Driver  
>depends: mdio  
## usbcore  
>description: null  
## cfbfillrect  
>description: Generic software accelerated fill rectangle  
## scsi_transport_sas  
>description: SAS Transport Attributes  
## usbip-host  
>description: USB/IP Host Driver  
>depends: usbip-core,usbcore  
## virtio_net  
>description: Virtio network driver  
>depends: virtio,net_failover,virtio_ring  
## ehci-pci  
>description: EHCI PCI platform driver  
>depends: usbcore,ehci-hcd  
## thermal  
>description: ACPI Thermal Zone Driver  
>depends: thermal_sys  
## mlx5_core  
>description: Mellanox 5th generation network adapters (ConnectX series) core driver  
>depends: mlx_compat,vxlan  
## virtio_scsi  
>description: Virtio SCSI HBA driver  
>depends: virtio,virtio_ring,blk-mq-virtio  
## tg3  
>description: Broadcom Tigon3 ethernet driver  
>depends: libphy  
## usbnet  
>description: USB network driver framework  
>depends: usbcore,mii  
## nct6775  
>description: Driver for NCT6775F and compatible chips  
>depends: hwmon-vid  
## intel_auxiliary  
>description: Auxiliary Bus Standalone  
## vmw_pvscsi  
>description: VMware PVSCSI driver  
## libphy  
>description: PHY library  
## atlantic  
>description: Marvell (Aquantia) Corporation(R) Network Driver  
>depends: crc-itu-t  
## e1000e  
>description: Intel(R) PRO/1000 Network Driver  
## auxiliary  
>description: Auxiliary Bus Standalone  
## mlx4_en  
>description: Mellanox ConnectX HCA Ethernet driver  
>depends: mlx4_core  
## igbvf  
>description: Intel(R) Gigabit Virtual Function Network Driver  
## mlx4_core  
>description: Mellanox ConnectX HCA low-level driver  
>depends: mlx_compat  
## hwmon-vid  
>description: hwmon-vid driver  
## virtio_blk  
>description: Virtio block driver  
>depends: virtio,virtio_ring,blk-mq-virtio  
## usbip-core  
>description: USB/IP Core  
>depends: usb-common  
## mlx4_ib  
>description: Mellanox ConnectX HCA InfiniBand driver  
>depends: mlx4_core,ib_core  
## vmxnet3  
>description: VMware vmxnet3 virtual NIC driver  
## r8152  
>description: Realtek RTL8152/RTL8153 Based USB Ethernet Adapters  
>depends: usbcore,mii  
## bnx2x  
>description: QLogic BCM57710/57711/57711E/57712/57712_MF/57800/57800_MF/57810/57810_MF/57840/57840_MF Driver  
>depends: mdio  
## atl1c  
>description: Qualcomm Atheros 100/1000M Ethernet Network Driver  
## sky2  
>description: Marvell Yukon 2 Gigabit Ethernet driver  
## qla2xxx  
>description: QLogic Fibre Channel HBA Driver  
>depends: scsi_transport_fc  
## rtc-cmos  
>description: Driver for PC-style 'CMOS' RTCs  
## aqc111  
>description: Aquantia AQtion USB to 5/2.5GbE Controllers  
>depends: usbnet,usbcore  
## r8153_ecm  
>description: Realtek USB ECM device  
>depends: cdc_ether,usbnet,usbcore  
## acpi-cpufreq  
>description: ACPI Processor P-States Driver  
## blk-mq-virtio  
>description: null  
## cfbcopyarea  
>description: Generic software accelerated copyarea  
## mii  
>description: MII hardware support library  
## ehci-hcd  
>description: USB 2.0 'Enhanced' Host Controller (EHCI) Driver  
>depends: usbcore  
## vesafb  
>description: null  
## e1000  
>description: Intel(R) PRO/1000 Network Driver  
## fb  
>description: null  
## skge  
>description: SysKonnect Gigabit Ethernet driver  
## font  
>description: Console Fonts  
## iavf  
>description: Intel(R) Ethernet Adaptive Virtual Function Driver  
>depends: intel_auxiliary  
## atl1e  
>description: Atheros 1000M Ethernet Network Driver  
## usb-common  
>description: null  
## virtio_ring  
>description: null  
## ts2020  
>description: Montage Technology TS2020 - Silicon tuner driver module  
>depends: regmap-i2c  
## jme  
>description: JMicron JMC2x0 PCI Express Ethernet driver  
>depends: mii  
## button  
>description: ACPI Button Driver  
## dvb-usb  
>description: A library module containing commonly used USB and DVB function USB DVB devices  
>depends: rc-core,dvb-core,usbcore  
## processor  
>description: ACPI Processor Driver  
## cxgb4  
>description: Chelsio T4/T5/T6 Network Driver  
## mptscsih  
>description: Fusion MPT SCSI Host driver  
>depends: mptbase  
## mptspi  
>description: Fusion MPT SPI Host driver  
>depends: mptscsih,mptbase,scsi_transport_spi  
## efifb  
>depends: cfbimgblt,cfbcopyarea,cfbfillrect,fb  
## cpufreq_performance  
>description: CPUfreq policy governor 'performance'  
## megaraid_mbox  
>description: LSI Logic MegaRAID Mailbox Driver  
>depends: megaraid_mm  
## cxgb3  
>description: Chelsio T3 Network Driver  
>depends: mdio  
## fbcon  
>depends: fb,font,bitblit  
## uhci-hcd  
>description: USB Universal Host Controller Interface driver  
>depends: usbcore  
## mlx_compat  
>description: Kernel backport module  
## mmc_core  
>description: null  
## 8139cp  
>description: RealTek RTL-8139C+ series 10/100 PCI Ethernet driver  
>depends: mii  
## r8125  
>description: Realtek RTL8125 2.5Gigabit Ethernet driver  
## vgastate  
>description: VGA State Save/Restore  
## mlxsw_pci  
>description: Mellanox switch PCI interface driver  
>depends: mlxsw_core  
## 8139too  
>description: RealTek RTL-8139 Fast Ethernet driver  
>depends: mii  
## dvb-usb-dvbsky  
>description: Driver for DVBSky USB  
>depends: dvb_usb_v2,dvb-core,usbcore,rc-core,m88ds3103  
## dvb-usb-dib0700  
>description: Driver for devices based on DiBcom DiB0700 - USB bridge  
>depends: dib7000m,dib9000,dibx000_common,dvb-usb,dib0090,dib0070,dib3000mc,usbcore,rc-core  
## sp2  
>description: CIMaX SP2/HF CI driver  
>depends: dvb-core  
## sdhci  
>description: Secure Digital Host Controller Interface core driver  
>depends: mmc_core  
## ice  
>description: Intel(R) Ethernet Connection E800 Series Linux Driver  
>depends: vxlan,auxiliary  
## atkbd  
>description: AT and PS/2 keyboard driver  
## crc-ccitt  
>description: CRC-CCITT calculations  
## mmc_block  
>description: Multimedia Card (MMC) block device driver  
>depends: mmc_core  
## mptsas  
>description: Fusion MPT SAS Host driver  
>depends: mptscsih,mptbase  
## i8042  
>description: i8042 keyboard and mouse controller driver  
## bitblit  
>description: Bit Blitting Operation  
>depends: fb,softcursor  
## mptbase  
>description: Fusion MPT base driver  
## softcursor  
>description: Generic software cursor  
>depends: fb  
## hid-generic  
>description: HID generic driver  
>depends: hid  
## crc-itu-t  
>description: CRC ITU-T V.41 calculations  
## syscopyarea  
>description: Generic copyarea (sys-to-sys)  
## cxgb4vf  
>description: Chelsio T4/T5/T6 Virtual Function (VF) Network Driver  
## megaraid_mm  
>description: LSI Logic Management Module  
## si2168  
>description: Silicon Labs Si2168 DVB-T/T2/C demodulator driver  
## scsi_transport_spi  
>description: SPI Transport Attributes  
## vub300  
>description: VUB300 USB to SD/MMC/SDIO adapter driver  
>depends: usbcore,mmc_core  
## mptctl  
>description: Fusion MPT misc device (ioctl) driver  
>depends: mptbase  
## fbdev  
>description: null  
## mlxsw_core  
>description: Mellanox switch device core driver  
## cdrom  
>description: null  
## cpufreq_ondemand  
>description: 'cpufreq_ondemand' - A dynamic cpufreq governor for Low Latency Frequency Transition capable processors  
## etxhci-hcd  
>description: 'eXtensible' Host Controller (xHC) Driver  
>depends: usbcore  
## via-sdmmc  
>description: VIA SD/MMC Card Interface driver  
>depends: mmc_core  
## bnx2  
>description: QLogic BCM5706/5708/5709/5716 Driver  
## cxgb  
>description: Chelsio 10Gb Ethernet Driver  
>depends: mdio  
## dvb-core  
>description: DVB Core Driver  
## mtk-sd  
>description: MediaTek SD/MMC Card Driver  
>depends: mmc_core  
## ushc  
>description: USB SD Host Controller driver  
>depends: usbcore,mmc_core  
## rc-core  
>description: null  
## scsi_transport_fc  
>description: FC Transport Attributes  
## sysfillrect  
>description: Generic fill rectangle (sys-to-sys)  
## vmw_vmci  
>description: VMware Virtual Machine Communication Interface.  
## dvb_usb_v2  
>description: DVB USB common  
>depends: rc-core,dvb-core,usbcore  
## megaraid  
>description: LSI Logic MegaRAID legacy driver  
## cdc_ether  
>description: USB CDC Ethernet devices  
>depends: usbnet,usbcore  
## bnxt_en  
>description: Broadcom BCM573xx network driver  
>depends: vxlan  
## m88ds3103  
>description: Montage Technology M88DS3103 DVB-S/S2 demodulator driver  
>depends: regmap-i2c,dvb-core  
## vga16fb  
>description: Legacy VGA framebuffer device driver  
>depends: cfbfillrect,cfbimgblt,cfbcopyarea,fb,vgastate  
## b44  
>description: Broadcom 44xx/47xx 10/100 PCI ethernet driver  
>depends: ssb,libphy,mii  
## si2157  
>description: Silicon Labs Si2146/2147/2148/2157/2158 silicon tuner driver  
## sysimgblt  
>description: 1-bit/8-bit to 1-32 bit color expansion (sys-to-sys)  
## bna  
>description: QLogic BR-series 10G PCIe Ethernet driver  
## fb_sys_fops  
>description: Generic file read (fb in system RAM)  
## cpufreq_conservative  
>description: 'cpufreq_conservative' - A dynamic cpufreq governor for Low Latency Frequency Transition capable processors optimised for use in a battery environment  
## sr_mod  
>description: SCSI cdrom (sr) driver  
## megaraid_sas  
>description: Avago MegaRAID SAS Driver  
## i40evf  
>description: Intel(R) XL710 X710 Virtual Function Network Driver  
## i915  
>description: Intel Graphics  
>depends: drm_kms_helper,drm,iosf_mbi,backlight,video,fb,button,i2c-algo-bit  
## drm_panel_orientation_quirks  
>description: null  
## rc-dib0700-rc5  
>depends: rc-core  
## libsas  
>description: SAS Transport Layer  
>depends: scsi_transport_sas  
## raid_class  
>description: RAID device class  
## video  
>description: ACPI Video Driver  
>depends: backlight  
## iosf_mbi  
>description: IOSF Mailbox Interface accessor  
## drm_kms_helper  
>description: DRM KMS helper  
>depends: drm,fb,fb_sys_fops,cfbfillrect,syscopyarea,cfbimgblt,sysfillrect,sysimgblt,cfbcopyarea  
## rc-dib0700-nec  
>depends: rc-core  
## generic_bl  
>description: Generic Backlight Driver  
>depends: backlight  
## nicvf  
>description: Cavium Thunder NIC Virtual Function Driver  
## rc-dvbsky  
>depends: rc-core  
## nicpf  
>description: Cavium Thunder NIC Physical Function Driver  
>depends: thunder_bgx  
## libfc  
>description: libfc  
>depends: scsi_transport_fc  
## mptlan  
>description: Fusion MPT LAN driver  
>depends: mptbase  
## backlight  
>description: Backlight Lowlevel Control Abstraction  
## drm  
>description: DRM panel infrastructure  
>depends: drm_panel_orientation_quirks  
## mpt2sas  
>description: LSI MPT Fusion SAS 2.0 Device Driver  
## freq_table  
>description: CPUfreq frequency table helpers  
## mperf  
>description: null  
## thermal_sys  
>description: Generic thermal management sysfs support  
## marvell10g  
>description: Marvell Alaska X 10Gigabit Ethernet PHY driver (MV88X3310)  
## amd-xgbe  
>description: AMD 10 Gigabit Ethernet Driver  
## nvidia  
>description: null  
## cpufreq_governor  
>description: null  
## nvidia-uvm  
>depends: nvidia  
