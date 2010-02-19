DefinitionBlock ("dsdt.aml", "DSDT", 1, "GBT   ", "GBTUACPI", 0x00001000)
{
    Scope (\_PR)
    {
        Processor (\_PR.CPU0, 0x00, 0x00000410, 0x06) {}
        Processor (\_PR.CPU1, 0x01, 0x00000410, 0x06) {}
        Processor (\_PR.CPU2, 0x02, 0x00000410, 0x06) {}
        Processor (\_PR.CPU3, 0x03, 0x00000410, 0x06) {}
    }

    Scope (\_PR.CPU0)
    {
        Method (_CST, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                0x01,
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW,
                            0x01,
                            0x02,
                            0x0000000000000000,
                            ,)
                    },
                    0x01,
                    0x14,
                    0x03E8
                }
            })
        }

        Method (_PCT, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                ResourceTemplate ()
                {
                    Register (FFixedHW,
                        0x00,
                        0x00,
                        0x0000000000000000,
                        ,)
                },

                ResourceTemplate ()
                {
                    Register (FFixedHW,
                        0x00,
                        0x00,
                        0x0000000000000000,
                        ,)
                }
            })
        }

        Method (_PSS, 0, NotSerialized)
        {
            Return (Package (0x03)
            {
                Package (0x06)
                {
                    0x00000AF0,
                    0x000157C0,
                    0x0000000A,
                    0x0000000A,
                    0x00004A25,
                    0x00004A25
                },

                Package (0x06)
                {
                    0x00000855,
                    0x000109A0,
                    0x0000000A,
                    0x0000000A,
                    0x0000081E,
                    0x0000081E
                },

                Package (0x06)
                {
                    0x00000640,
                    0x0000C738,
                    0x0000000A,
                    0x0000000A,
                    0x00000616,
                    0x00000616
                }
            })
        }
    }

    Scope (\_PR.CPU1)
    {
        Method (_CST, 0, NotSerialized)
        {
            Return (^^CPU0._CST)
        }
 
        Method (_PCT, 0, NotSerialized)
        {
            Return (^^CPU0._PCT)
        }

        Method (_PSS, 0, NotSerialized)
        {
            Return (^^CPU0._PSS)
        }
    }

    Name (\_S0, Package (0x04)
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\SS1, Package (0x04)
    {
        0x01, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S3, Package (0x04)
    {
        0x05, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S4, Package (0x04)
    {
        0x06, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S5, Package (0x04)
    {
        0x07, 
        0x00, 
        0x00, 
        0x00
    })
    Name (FLAG, 0x00)
    Name (STAT, 0x00)
    OperationRegion (SMOD, SystemMemory, 0x000FF840, 0x01)
    Field (SMOD, ByteAcc, NoLock, Preserve)
    {
            ,   7, 
        SUSF,   1
    }

    OperationRegion (\DEBG, SystemIO, 0x80, 0x01)
    Field (\DEBG, ByteAcc, NoLock, Preserve)
    {
        DBG1,   8
    }

    OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
    Field (RCRB, DWordAcc, Lock, Preserve)
    {
                Offset (0x3404), 
            ,   7, 
        HPTF,   1
    }

    OperationRegion (ELKM, SystemMemory, 0x000FFFEA, 0x01)
    Field (ELKM, ByteAcc, NoLock, Preserve)
    {
            ,   1, 
            ,   1, 
        ELSO,   1, 
            ,   1, 
            ,   1, 
            ,   1, 
            ,   1
    }

    OperationRegion (EXTM, SystemMemory, 0x000FF830, 0x10)
    Field (EXTM, WordAcc, NoLock, Preserve)
    {
        ROM1,   16, 
        RMS1,   16, 
        ROM2,   16, 
        RMS2,   16, 
        ROM3,   16, 
        RMS3,   16, 
        AMEM,   32
    }

    OperationRegion (\SMIC, SystemIO, 0xB2, 0x01)
    Field (\SMIC, ByteAcc, NoLock, Preserve)
    {
        SCP,    8
    }

    OperationRegion (TCOI, SystemIO, 0x0460, 0x08)
    Field (TCOI, WordAcc, NoLock, Preserve)
    {
                Offset (0x04), 
            ,   9, 
        SCIS,   1, 
                Offset (0x06)
    }

    OperationRegion (\GP2C, SystemIO, 0x042C, 0x02)
    Field (\GP2C, ByteAcc, NoLock, Preserve)
    {
        G2C1,   8, 
        G2C2,   8
    }

    OperationRegion (\GBLE, SystemIO, 0x0421, 0x01)
    Field (\GBLE, ByteAcc, NoLock, Preserve)
    {
        ESMI,   8
    }

    OperationRegion (APMP, SystemIO, 0xB2, 0x02)
    Field (APMP, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    OperationRegion (\AGPS, SystemIO, 0x0438, 0x04)
    Field (\AGPS, ByteAcc, NoLock, Preserve)
    {
        GPSE,   16, 
        GPSS,   16
    }

    OperationRegion (\GPCN, SystemIO, 0x0442, 0x01)
    Field (\GPCN, ByteAcc, NoLock, Preserve)
    {
            ,   1, 
        SWGC,   1, 
                Offset (0x01)
    }

    Name (OSFX, 0x01)
    Name (OSFL, 0x01)
    Method (STRC, 2, NotSerialized)
    {
        If (LNotEqual (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (0x00)
        }

        Add (SizeOf (Arg0), 0x01, Local0)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        Store (Arg0, BUF0)
        Store (Arg1, BUF1)
        While (Local0)
        {
            Decrement (Local0)
            If (LNotEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (
                BUF1, Local0))))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    OperationRegion (INFO, SystemMemory, 0x000FF840, 0x01)
    Field (INFO, ByteAcc, NoLock, Preserve)
    {
        KBDI,   1, 
        RTCW,   1, 
        PS2F,   1, 
        IRFL,   2, 
        DISE,   1, 
        SSHU,   1
    }

    Scope (\)
    {
        Name (PICF, 0x00)
        Method (_PIC, 1, NotSerialized)
        {
            Store (Arg0, PICF)
        }
    }

    Method (\_PTS, 1, NotSerialized)
    {
        Or (Arg0, 0xF0, Local0)
        Store (Local0, DBG1)
        OSTP ()
        If (LEqual (Arg0, 0x01)) {}
        If (LEqual (Arg0, 0x03)) {}
        If (LEqual (Arg0, 0x05))
        {
            Store (ESMI, Local0)
            And (Local0, 0xFB, Local0)
            Store (Local0, ESMI)
            Store (0x99, SMIP)
        }

        If (LEqual (Arg0, 0x04))
        {
            If (LNot (PICF))
            {
                Sleep (0x64)
            }
        }
    }

    Method (DTGP, 5, NotSerialized)
    {
        If (LEqual (Arg0, Buffer (0x10)
        {
            0xc6, 0xb7, 0xb5, 0xa0, 0x18, 0x13, 0x1c, 0x44,
            0xb0, 0xc9, 0xfe, 0x69, 0x5e, 0xaf, 0x94, 0x9b
        }))
        {
            If (LEqual (Arg1, One))
            {
                If (LEqual (Arg2, Zero))
                {
                    Store (Buffer (One)
                    {
                        0x03
                    }, Arg4)

                    Return (One)
                }

                If (LEqual (Arg2, One))
                {
                    Return (One)
                }
            }
        }

        Store (Buffer (One)
        {
            0x00
        }, Arg4)

        Return (Zero)
    }


    Method (\_WAK, 1, NotSerialized)
    {
        Store (0xFF, DBG1)
        If (LEqual (Arg0, 0x03))
        {
            Store (0x8F, SCP)
        }

        If (LEqual (Arg0, 0x04))
        {
            If (LEqual (OSFL, 0x00))
            {
                If (LEqual (OSFX, 0x03))
                {
                    Store (0x59, SMIP)
                }
                Else
                {
                    Store (0x58, SMIP)
                }
            }

            If (LEqual (OSFL, 0x01))
            {
                Store (0x56, SMIP)
            }

            If (LEqual (OSFL, 0x02))
            {
                Store (0x57, SMIP)
            }

            If (LEqual (OSFX, 0x03))
            {
                Store (0x59, SMIP)
            }
        }

        If (LEqual (Arg0, 0x01)) {}
        If (OSFL)
        {
            Notify (\_SB.PWRB, 0x02)
        }
        Else
        {
            If (LEqual (RTCW, 0x00))
            {
                Notify (\_SB.PWRB, 0x02)
            }
        }

        Notify (\_SB.PCI0.USB0, 0x00)
        Notify (\_SB.PCI0.USB1, 0x00)
        Notify (\_SB.PCI0.USB2, 0x00)
        Notify (\_SB.PCI0.USB3, 0x00)

        Return (Package (0x02)
        {
            Zero,
            Zero
        })
    }

    Scope (\_SI)
    {
        Method (_MSG, 1, NotSerialized)
        {
            Store (Zero, Local0)
        }

        Method (_SST, 1, NotSerialized)
        {
            Store (Zero, Local0)
        }
    }

    Scope (\_GPE)
    {
        Method (_L08, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.PX40.UAR1, 0x02)
        }

        Method (_L06, 0, NotSerialized)
        {
            If (\_SB.PCI0.IGD0.GSSE)
            {
                \_SB.PCI0.IGD0.OPRN ()
            }
            Else
            {
                Store (0x01, SCIS)
            }
        }

        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB0, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB1, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB2, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L0E, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB3, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USBE, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.HUB0, 0x02)
        }

        Method (_L09, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.PEX0, 0x02)
            Notify (\_SB.PCI0.PEX1, 0x02)
            Notify (\_SB.PCI0.PEX2, 0x02)
            Notify (\_SB.PCI0.PEX3, 0x02)
            Notify (\_SB.PCI0.PEX4, 0x02)
            Notify (\_SB.PCI0.PEX5, 0x02)
        }
    }

    Scope (\_SB)
    {
        Device (PWRB)
        {
            Name (_CID, EisaId ("PNP0C0C"))
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Name (_UID, 0x01)
            Name (_BBN, 0x00)
            Method (_S3D, 0, NotSerialized)
            {
                If (LEqual (OSFL, 0x02))
                {
                    Return (0x02)
                }
                Else
                {
                    Return (0x03)
                }
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    WordBusNumber (ResourceConsumer, MinNotFixed, MaxNotFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x00FF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0100,             // Length
                        ,, )
                    IO (Decode16,
                        0x0CF8,             // Range Minimum
                        0x0CF8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x0CF7,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0CF8,             // Length
                        ,, , TypeStatic)
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Granularity
                        0x0D00,             // Range Minimum
                        0xFFFF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0xF300,             // Length
                        ,, , TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000A0000,         // Range Minimum
                        0x000BFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00020000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000C0000,         // Range Minimum
                        0x000DFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00020000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x00100000,         // Range Minimum
                        0xFEBFFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0xFFF00000,         // Length
                        ,, _Y00, AddressRangeMemory, TypeStatic)
                })
                CreateDWordField (BUF0, \_SB.PCI0._CRS._Y00._MIN, TCMM)
                CreateDWordField (BUF0, \_SB.PCI0._CRS._Y00._LEN, TOMM)
                Add (AMEM, 0x00010000, TCMM)
                Add (TCMM, 0x00010000, TCMM)
                Subtract (0xFEC00000, TCMM, TOMM)
                Return (BUF0)
            }

            Name (PICM, Package (0x16)
            {
                Package (0x04)
                {
                    0x0002FFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x01, 
                    \_SB.PCI0.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    \_SB.PCI0.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    \_SB.PCI0.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001BFFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x01, 
                    \_SB.PCI0.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    \_SB.PCI0.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    \_SB.PCI0.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x01, 
                    \_SB.PCI0.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    \_SB.PCI0.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    \_SB.PCI0.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x01, 
                    \_SB.PCI0.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x00, 
                    \_SB.PCI0.LNK1, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x01, 
                    \_SB.PCI0.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x02, 
                    \_SB.PCI0.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x03, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x00, 
                    \_SB.PCI0.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x01, 
                    \_SB.PCI0.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x01, 
                    \_SB.PCI0.LNKD, 
                    0x00
                }
            })
            Name (APIC, Package (0x16)
            {
                Package (0x04)
                {
                    0x0002FFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x01, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001BFFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x01, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x01, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x01, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x00, 
                    0x00, 
                    0x17
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x01, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x02, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x03, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x00, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x01, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x01, 
                    0x00, 
                    0x13
                }
            })
            Method (_PRT, 0, NotSerialized)
            {
                If (LNot (PICF))
                {
                    Return (PICM)
                }
                Else
                {
                    Return (APIC)
                }
            }

            Device (IGD0)
            {
                Name (_ADR, 0x00020000)
                OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)
                Field (IGDP, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x12), 
                        ,   1, 
                    GIVD,   1, 
                        ,   2, 
                    GUMA,   3, 
                            Offset (0x14), 
                        ,   4, 
                    GMFN,   1, 
                            Offset (0x18), 
                    SSRW,   32, 
                            Offset (0xA4), 
                    ASLE,   8, 
                            Offset (0xA8), 
                    GSSE,   1, 
                    GSSB,   14, 
                    GSES,   1, 
                            Offset (0xB0), 
                            Offset (0xB1), 
                    CDVL,   5, 
                            Offset (0xB2), 
                            Offset (0xBC), 
                    ASLS,   32
                }

                OperationRegion (IGDM, SystemMemory, 0xFFFF0000, 0x2040)
                Field (IGDM, AnyAcc, NoLock, Preserve)
                {
                    SIGN,   128, 
                    SIZE,   32, 
                    OVER,   32, 
                    SVER,   256, 
                    VVER,   128, 
                    GVER,   128, 
                    MBOX,   32, 
                            Offset (0x100), 
                    DRDY,   32, 
                    CSTS,   32, 
                    CEVT,   32, 
                            Offset (0x120), 
                    DIDL,   256, 
                    CPDL,   256, 
                    CADL,   256, 
                    NADL,   256, 
                    ASLP,   32, 
                    TIDX,   32, 
                    CHPD,   32, 
                    CLID,   32, 
                    CDCK,   32, 
                    SXSW,   32, 
                    EVTS,   32, 
                    CNOT,   32, 
                    NRDY,   32, 
                            Offset (0x200), 
                    SCIE,   1, 
                    GEFC,   4, 
                    GXFC,   3, 
                    GESF,   8, 
                            Offset (0x204), 
                    PARM,   32, 
                    DSLP,   32, 
                            Offset (0x300), 
                    ARDY,   32, 
                    ASLC,   32, 
                    TCHE,   32, 
                    ALSI,   32, 
                    BCLP,   32, 
                    PFIT,   32, 
                            Offset (0x400), 
                    GVD1,   57344, 
                    IBTT,   8, 
                    IPAT,   8, 
                    ITVF,   8, 
                    ITVM,   8, 
                    IPSC,   8, 
                    IBLC,   8, 
                    IBIA,   8, 
                    ISSC,   8, 
                    I409,   8, 
                    I509,   8, 
                    I609,   8, 
                    I709,   8, 
                    IDMM,   8, 
                    IDMS,   8, 
                    IF1E,   8, 
                    GSMI,   8, 
                    HVCO,   8, 
                    LIDS,   8, 
                    CGCS,   16
                }

                Name (DBTB, Package (0x11)
                {
                    0x00, 
                    0x01, 
                    0x02, 
                    0x03, 
                    0x04, 
                    0x05, 
                    0x06, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0x0A, 
                    0x10, 
                    0x11, 
                    0x12, 
                    0x13, 
                    0x14, 
                    0xFF
                })
                Name (SUCC, 0x01)
                Name (NVLD, 0x02)
                Name (CRIT, 0x04)
                Name (NCRT, 0x06)
                Method (OPRN, 0, Serialized)
                {
                    Method (GBDA, 0, Serialized)
                    {
                        If (LEqual (GESF, 0x00))
                        {
                            Store (0x00, PARM)
                            Or (PARM, ShiftLeft (0x01, 0x00), PARM)
                            Or (PARM, ShiftLeft (0x01, 0x03), PARM)
                            Or (PARM, ShiftLeft (0x01, 0x04), PARM)
                            Or (PARM, ShiftLeft (0x01, 0x05), PARM)
                            Or (PARM, ShiftLeft (0x01, 0x06), PARM)
                            Or (PARM, ShiftLeft (0x01, 0x09), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x01))
                        {
                            Store (0x0240, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            Name (LOOP, 0x00)
                            And (PARM, 0xFFFFFF00, PARM)
                            Or (DerefOf (Index (DBTB, IBTT)), PARM, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (IPSC, PARM)
                            Or (PARM, ShiftLeft (IPAT, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Or (PARM, ShiftLeft (LIDS, 0x10), PARM)
                            Add (PARM, 0x00010000, PARM)
                            Or (PARM, ShiftLeft (IBIA, 0x14), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (ITVF, PARM)
                            Or (PARM, ShiftLeft (ITVM, 0x04), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            Store (GIVD, PARM)
                            XOr (PARM, 0x01, PARM)
                            Or (PARM, ShiftLeft (GMFN, 0x01), PARM)
                            Or (PARM, ShiftLeft (0x02, 0x0B), PARM)
                            If (LEqual (IDMM, 0x00))
                            {
                                Or (PARM, ShiftLeft (IDMS, 0x0D), PARM)
                            }

                            If (LOr (LEqual (IDMM, 0x01), LEqual (IDMM, 0x03)))
                            {
                                Or (PARM, ShiftLeft (IDMS, 0x11), PARM)
                            }

                            Or (PARM, ShiftLeft (CGCS, 0x15), PARM)
                            Store (0x01, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            Store (0x00, PARM)
                            If (ISSC)
                            {
                                Or (PARM, 0x03, PARM)
                            }

                            Store (0x00, GESF)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (CRIT)
                    }

                    Method (SBCB, 0, Serialized)
                    {
                        If (LEqual (GESF, 0x00))
                        {
                            Store (0x00, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x01))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x03))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (And (PARM, 0x0F), ITVF)
                            Store (ShiftRight (And (PARM, 0xF0), 0x04), ITVM)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x08))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x09))
                        {
                            And (PARM, 0xFF, IBTT)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            And (PARM, 0xFF, IPSC)
                            If (And (ShiftRight (PARM, 0x08), 0xFF))
                            {
                                And (ShiftRight (PARM, 0x08), 0xFF, IPAT)
                                Decrement (IPAT)
                            }

                            And (ShiftRight (PARM, 0x14), 0x07, IBIA)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0B))
                        {
                            And (ShiftRight (PARM, 0x01), 0x01, IF1E)
                            If (And (PARM, ShiftLeft (0x0F, 0x0D)))
                            {
                                And (ShiftRight (PARM, 0x0D), 0x0F, IDMS)
                                Store (0x00, IDMM)
                            }
                            Else
                            {
                                And (ShiftRight (PARM, 0x11), 0x0F, IDMS)
                                Store (0x01, IDMM)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x10))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x11))
                        {
                            Store (ShiftLeft (LIDS, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x12))
                        {
                            If (And (PARM, 0x01))
                            {
                                If (LEqual (ShiftRight (PARM, 0x01), 0x01))
                                {
                                    Store (0x01, ISSC)
                                }
                                Else
                                {
                                    Store (Zero, GESF)
                                    Return (CRIT)
                                }
                            }
                            Else
                            {
                                Store (0x00, ISSC)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x13))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (SUCC)
                    }

                    If (LEqual (GEFC, 0x04))
                    {
                        Store (GBDA (), GXFC)
                    }

                    If (LEqual (GEFC, 0x06))
                    {
                        Store (SBCB (), GXFC)
                    }

                    Store (PARM, SSRW)
                    Store (0x00, GEFC)
                    Store (0x01, SCIS)
                    Store (0x00, GSSE)
                    Store (0x00, SCIE)
                    Return (Zero)
                }
            }

            Device (IGD1)
            {
                Name (_ADR, 0x00020001)
            }

            Device (PEX0)
            {
                Name (_ADR, 0x001C0000)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC0, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }
                })
                Name (API0, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PIC0)
                    }
                    Else
                    {
                        Return (API0)
                    }
                }
            }

            Device (PEX1)
            {
                Name (_ADR, 0x001C0001)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC1, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }
                })
                Name (API1, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PIC1)
                    }
                    Else
                    {
                        Return (API1)
                    }
                }
            }

            Device (PEX2)
            {
                Name (_ADR, 0x001C0002)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC2, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKB, 
                        0x00
                    }
                })
                Name (API2, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PIC2)
                    }
                    Else
                    {
                        Return (API2)
                    }
                }
            }

            Device (PEX3)
            {
                Name (_ADR, 0x001C0003)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC3, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }
                })
                Name (API3, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x12
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PIC3)
                    }
                    Else
                    {
                        Return (API3)
                    }
                }
            }

            Device (PEX4)
            {
                Name (_ADR, 0x001C0004)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC4, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }
                })
                Name (API4, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PIC4)
                    }
                    Else
                    {
                        Return (API4)
                    }
                }
            }

            Device (PEX5)
            {
                Name (_ADR, 0x001C0005)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC5, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }
                })
                Name (API5, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PIC5)
                    }
                    Else
                    {
                        Return (API5)
                    }
                }
            }

            Device (HUB0)
            {
                Name (_ADR, 0x001E0000)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (PICM, Package (0x08)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNKE, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x00, 
                        \_SB.PCI0.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x01, 
                        \_SB.PCI0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x02, 
                        \_SB.PCI0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x03, 
                        \_SB.PCI0.LNKE, 
                        0x00
                    }
                })
                Name (APIC, Package (0x08)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x00, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x01, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x02, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x03, 
                        0x00, 
                        0x14
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PICM)
                    }
                    Else
                    {
                        Return (APIC)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x0B, 
                        0x05
                    })
                }
            }

            Device (PX40)
            {
                Name (_ADR, 0x001F0000)
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x02)
                    {
                        "device-id",
                        Buffer (0x04)
                        {
                            0xb9, 0x27, 0x00, 0x00
                        }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
                OperationRegion (PREV, PCI_Config, 0x08, 0x01)
                Scope (\)
                {
                    Field (\_SB.PCI0.PX40.PREV, ByteAcc, NoLock, Preserve)
                    {
                        REV0,   8
                    }
                }

                OperationRegion (PIRQ, PCI_Config, 0x60, 0x04)
                Scope (\)
                {
                    Field (\_SB.PCI0.PX40.PIRQ, ByteAcc, NoLock, Preserve)
                    {
                        PIRA,   8, 
                        PIRB,   8, 
                        PIRC,   8, 
                        PIRD,   8
                    }
                }

                OperationRegion (PIR2, PCI_Config, 0x68, 0x04)
                Scope (\)
                {
                    Field (\_SB.PCI0.PX40.PIR2, ByteAcc, NoLock, Preserve)
                    {
                        PIRE,   8, 
                        PIRF,   8, 
                        PIRG,   8, 
                        PIRH,   8
                    }
                }

                OperationRegion (LPIO, PCI_Config, 0x80, 0x0E)
                Scope (\)
                {
                    Field (\_SB.PCI0.PX40.LPIO, ByteAcc, NoLock, Preserve)
                    {
                        UAIO,   8, 
                        PRIO,   8, 
                        LPE1,   8, 
                        LPE2,   8, 
                        GN1L,   8, 
                        GN1H,   8, 
                        GN2L,   8, 
                        GN2H,   8
                    }

                    Method (DISD, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            And (LPE1, 0xFE, LPE1)
                        }

                        If (LEqual (Arg0, 0x01))
                        {
                            And (LPE1, 0xFD, LPE1)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            And (LPE1, 0xFB, LPE1)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            And (LPE1, 0xF7, LPE1)
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            And (LPE2, 0xFC, LPE2)
                        }

                        If (LEqual (Arg0, 0x05))
                        {
                            And (LPE1, 0xDF, LPE1)
                        }

                        If (LEqual (Arg0, 0x06))
                        {
                            And (GN2L, 0xFE, GN2L)
                        }
                    }

                    Method (CKIO, 2, NotSerialized)
                    {
                        If (LEqual (Arg1, 0x00))
                        {
                            Or (LPE1, 0x01, LPE1)
                            And (UAIO, 0xF0, Local0)
                            If (LEqual (Arg0, 0x03F8))
                            {
                                Or (Local0, 0x00, UAIO)
                            }

                            If (LEqual (Arg0, 0x02F8))
                            {
                                Or (Local0, 0x01, UAIO)
                            }

                            If (LEqual (Arg0, 0x02E8))
                            {
                                Or (Local0, 0x05, UAIO)
                            }

                            If (LEqual (Arg0, 0x03E8))
                            {
                                Or (Local0, 0x07, UAIO)
                            }
                        }

                        If (LEqual (Arg1, 0x01))
                        {
                            Or (LPE1, 0x02, LPE1)
                            And (UAIO, 0x0F, Local0)
                            If (LEqual (Arg0, 0x03F8))
                            {
                                Or (Local0, 0x00, UAIO)
                            }

                            If (LEqual (Arg0, 0x02F8))
                            {
                                Or (Local0, 0x10, UAIO)
                            }

                            If (LEqual (Arg0, 0x02E8))
                            {
                                Or (Local0, 0x50, UAIO)
                            }

                            If (LEqual (Arg0, 0x03E8))
                            {
                                Or (Local0, 0x70, UAIO)
                            }
                        }

                        If (LEqual (Arg1, 0x02))
                        {
                            Or (LPE1, 0x04, LPE1)
                            And (PRIO, 0xFC, Local0)
                            If (LEqual (Arg0, 0x0378))
                            {
                                Or (Local0, 0x00, PRIO)
                            }

                            If (LEqual (Arg0, 0x0278))
                            {
                                Or (Local0, 0x01, PRIO)
                            }

                            If (LEqual (Arg0, 0x03BC))
                            {
                                Or (Local0, 0x02, PRIO)
                            }
                        }

                        If (LEqual (Arg1, 0x03))
                        {
                            Or (LPE1, 0x08, LPE1)
                        }

                        If (LEqual (Arg1, 0x04))
                        {
                            If (LEqual (Arg0, 0x0201))
                            {
                                Or (LPE2, 0x01, LPE2)
                            }

                            If (LEqual (Arg0, 0x0209))
                            {
                                Or (LPE2, 0x02, LPE2)
                            }
                        }

                        If (LEqual (Arg1, 0x06))
                        {
                            If (LNotEqual (Arg0, 0xFFFF))
                            {
                                And (Arg0, 0xFF, Local0)
                                Or (Local0, 0x01, GN2L)
                                ShiftRight (Arg0, 0x08, GN2H)
                            }
                            Else
                            {
                                Store (Zero, GN2H)
                                Store (Zero, GN2L)
                            }
                        }
                    }
                }

                Scope (\)
                {
                    Method (SLDM, 2, NotSerialized)
                    {
                    }
                }

                Scope (\)
                {
                    OperationRegion (\SCPP, SystemIO, 0xB2, 0x01)
                    Field (\SCPP, ByteAcc, NoLock, Preserve)
                    {
                        SMIP,   8
                    }
                }

                Method (\_SB.PCI0._INI, 0, NotSerialized)
                {
                    Store (0x59, SMIP)
                    Store (0x00, OSFL)
                    Store (0x03, OSFX)
                }

                Scope (\)
                {
                    Method (OSTP, 0, NotSerialized)
                    {
                        If (LEqual (OSFL, 0x01))
                        {
                            Store (0x56, SMIP)
                        }

                        If (LEqual (OSFL, 0x02))
                        {
                            Store (0x57, SMIP)
                        }

                        If (LEqual (OSFL, 0x00))
                        {
                            If (LEqual (OSFX, 0x03))
                            {
                                Store (0x59, SMIP)
                            }
                            Else
                            {
                                Store (0x58, SMIP)
                            }
                        }

                        If (LEqual (OSFX, 0x03))
                        {
                            Store (0x59, SMIP)
                        }
                    }
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x01)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x01,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x01,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0074,             // Range Minimum
                            0x0074,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        IO (Decode16,
                            0x0091,             // Range Minimum
                            0x0091,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x01,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0290,             // Range Minimum
                            0x0290,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0290,             // Range Minimum
                            0x0290,             // Range Maximum
                            0x01,               // Alignment
                            0x05,               // Length
                            )
                        IO (Decode16,
                            0x0880,             // Range Minimum
                            0x0880,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMA1)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x11,               // Length
                            )
                        IO (Decode16,
                            0x0094,             // Range Minimum
                            0x0094,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (ATT5, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Name (ATT6, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSFX, 0x03))
                        {
                            If (HPTF)
                            {
                                Return (ATT6)
                            }
                            Else
                            {
                                Return (ATT5)
                            }
                        }
                        Else
                        {
                            Return (ATT5)
                        }
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (ATT3, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadWrite,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            )
                    })
                    Name (ATT4, ResourceTemplate ()
                    {
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSFX, 0x03))
                        {
                            If (HPTF)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSFX, 0x03))
                        {
                            If (HPTF)
                            {
                                Return (ATT3)
                            }
                            Else
                            {
                                Return (ATT4)
                            }
                        }
                        Else
                        {
                            Return (ATT4)
                        }
                    }
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (ATT0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Name (ATT1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSFX, 0x03))
                        {
                            If (HPTF)
                            {
                                Return (ATT1)
                            }
                            Else
                            {
                                Return (ATT0)
                            }
                        }
                        Else
                        {
                            Return (ATT0)
                        }
                    }
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Scope (\)
                {
                    OperationRegion (WIN1, SystemIO, 0x2E, 0x02)
                    Field (WIN1, ByteAcc, NoLock, Preserve)
                    {
                        INDP,   8, 
                        DATP,   8
                    }

                    OperationRegion (GPIO, SystemIO, 0x0800, 0x05)
                    Field (GPIO, ByteAcc, NoLock, Preserve)
                    {
                        GO01,   8, 
                        GO02,   8, 
                        GO03,   8, 
                        GO04,   8, 
                        GO05,   8
                    }

                    IndexField (INDP, DATP, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x02), 
                        CFG,    8, 
                                Offset (0x07), 
                        LDN,    8, 
                                Offset (0x20), 
                        IDHI,   8, 
                        IDLO,   8, 
                        POWC,   8, 
                                Offset (0x30), 
                        ACTR,   8, 
                                Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                        IO2H,   8, 
                        IO2L,   8, 
                                Offset (0x70), 
                        INTR,   8, 
                                Offset (0x72), 
                        INT1,   8, 
                                Offset (0x74), 
                        DMCH,   8, 
                                Offset (0xC0), 
                        GP40,   8, 
                                Offset (0xF0), 
                        OPT1,   8, 
                        OPT2,   8, 
                        OPT3,   8, 
                        OPT4,   8
                    }

                    Method (ENFG, 0, NotSerialized)
                    {
                        Store (0x87, INDP)
                        Store (0x01, INDP)
                        Store (0x55, INDP)
                        Store (0x55, INDP)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Store (0x02, CFG)
                    }

                    Method (GSRG, 1, NotSerialized)
                    {
                        Store (Arg0, INDP)
                        Return (DATP)
                    }

                    Method (SSRG, 2, NotSerialized)
                    {
                        Store (Arg0, INDP)
                        Store (Arg1, DATP)
                    }
                }

                Device (FDC0)
                {
                    Name (_HID, EisaId ("PNP0700"))
                    Method (_STA, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (Zero, LDN)
                        If (ACTR)
                        {
                            EXFG ()
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LOr (IOAH, IOAL))
                            {
                                EXFG ()
                                Return (0x0D)
                            }
                            Else
                            {
                                EXFG ()
                                Return (0x00)
                            }
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (0x00, LDN)
                        Store (Zero, ACTR)
                        SLDM (DMCH, 0x04)
                        EXFG ()
                        DISD (0x03)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                _Y01)
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {6}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {2}
                        })
                        CreateByteField (BUF0, \_SB.PCI0.PX40.FDC0._CRS._Y01._MIN, IOLO)
                        CreateByteField (BUF0, 0x03, IOHI)
                        CreateByteField (BUF0, \_SB.PCI0.PX40.FDC0._CRS._Y01._MAX, IORL)
                        CreateByteField (BUF0, 0x05, IORH)
                        ENFG ()
                        EXFG ()
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                )
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {6}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {2}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x02, IOAD)
                        CreateWordField (Arg0, 0x19, IRQW)
                        CreateByteField (Arg0, 0x1C, DMAV)
                        ENFG ()
                        Store (Zero, LDN)
                        Store (One, ACTR)
                        SLDM (DMCH, DMCH)
                        CKIO (IOAD, 0x03)
                        EXFG ()
                    }
                }

                Device (UAR1)
                {
                    Name (_HID, EisaId ("PNP0501"))
                    Name (_UID, 0x01)
                    Method (_STA, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (0x01, LDN)
                        If (ACTR)
                        {
                            EXFG ()
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LOr (IOAH, IOAL))
                            {
                                EXFG ()
                                Return (0x0D)
                            }
                            Else
                            {
                                EXFG ()
                                Return (0x00)
                            }
                        }

                        EXFG ()
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (0x01, LDN)
                        Store (Zero, ACTR)
                        EXFG ()
                        DISD (0x00)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF1, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _Y02)
                            IRQNoFlags (_Y03)
                                {}
                        })
                        CreateByteField (BUF1, \_SB.PCI0.PX40.UAR1._CRS._Y02._MIN, IOLO)
                        CreateByteField (BUF1, 0x03, IOHI)
                        CreateByteField (BUF1, \_SB.PCI0.PX40.UAR1._CRS._Y02._MAX, IORL)
                        CreateByteField (BUF1, 0x05, IORH)
                        CreateWordField (BUF1, \_SB.PCI0.PX40.UAR1._CRS._Y03._INT, IRQW)
                        ENFG ()
                        Store (0x01, LDN)
                        Store (IOAL, IOLO)
                        Store (IOAL, IORL)
                        Store (IOAH, IOHI)
                        Store (IOAH, IORH)
                        Store (One, Local0)
                        ShiftLeft (Local0, INTR, IRQW)
                        EXFG ()
                        Return (BUF1)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x02, IOAD)
                        CreateWordField (Arg0, 0x09, IRQW)
                        ENFG ()
                        Store (0x01, LDN)
                        Store (One, ACTR)
                        Store (IOLO, IOAL)
                        Store (IOHI, IOAH)
                        FindSetRightBit (IRQW, Local0)
                        Subtract (Local0, 0x01, INTR)
                        EXFG ()
                        CKIO (IOAD, 0x00)
                    }

                    Method (_PRW, 0, NotSerialized)
                    {
                        If (SUSF)
                        {
                            Return (Package (0x02)
                            {
                                0x08, 
                                0x03
                            })
                        }
                        Else
                        {
                            Return (Package (0x02)
                            {
                                0x08, 
                                0x01
                            })
                        }
                    }

                    Method (_PSW, 1, NotSerialized)
                    {
                        If (Arg0)
                        {
                            Or (G2C2, 0x01, G2C2)
                        }
                        Else
                        {
                            And (G2C2, 0xFE, G2C2)
                        }
                    }
                }

                Device (LPT1)
                {
                    Name (_HID, EisaId ("PNP0400"))
                    Method (_STA, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (0x03, LDN)
                        And (OPT1, 0x02, Local0)
                        If (LNotEqual (Local0, 0x02))
                        {
                            If (ACTR)
                            {
                                EXFG ()
                                Return (0x0F)
                            }
                            Else
                            {
                                If (LOr (IOAH, IOAL))
                                {
                                    EXFG ()
                                    Return (0x0D)
                                }
                                Else
                                {
                                    EXFG ()
                                    Return (0x00)
                                }
                            }
                        }
                        Else
                        {
                            EXFG ()
                            Return (0x00)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (0x03, LDN)
                        Store (Zero, ACTR)
                        EXFG ()
                        DISD (0x02)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF5, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _Y04)
                            IRQNoFlags (_Y05)
                                {}
                        })
                        CreateByteField (BUF5, \_SB.PCI0.PX40.LPT1._CRS._Y04._MIN, IOLO)
                        CreateByteField (BUF5, 0x03, IOHI)
                        CreateByteField (BUF5, \_SB.PCI0.PX40.LPT1._CRS._Y04._MAX, IORL)
                        CreateByteField (BUF5, 0x05, IORH)
                        CreateByteField (BUF5, \_SB.PCI0.PX40.LPT1._CRS._Y04._LEN, IOLE)
                        CreateWordField (BUF5, \_SB.PCI0.PX40.LPT1._CRS._Y05._INT, IRQW)
                        ENFG ()
                        Store (0x03, LDN)
                        Store (IOAL, IOLO)
                        Store (IOLO, IORL)
                        Store (IOAH, IOHI)
                        Store (IOHI, IORH)
                        If (LEqual (IOLO, 0xBC))
                        {
                            Store (0x04, IOLE)
                        }
                        Else
                        {
                            Store (0x08, IOLE)
                        }

                        Store (One, Local0)
                        Store (INTR, Local5)
                        ShiftLeft (Local0, Local5, IRQW)
                        EXFG ()
                        Return (BUF5)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x02, IOAD)
                        CreateByteField (Arg0, 0x04, IORL)
                        CreateByteField (Arg0, 0x05, IORH)
                        CreateWordField (Arg0, 0x09, IRQW)
                        ENFG ()
                        Store (0x03, LDN)
                        Store (One, ACTR)
                        Store (IOLO, IOAL)
                        Store (IOHI, IOAH)
                        FindSetLeftBit (IRQW, Local0)
                        Subtract (Local0, 0x01, Local0)
                        Store (Local0, INTR)
                        EXFG ()
                        CKIO (IOAD, 0x02)
                    }
                }

                Device (ECP1)
                {
                    Name (_HID, EisaId ("PNP0401"))
                    Method (_STA, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (0x03, LDN)
                        And (OPT1, 0x02, Local0)
                        If (LEqual (Local0, 0x02))
                        {
                            If (ACTR)
                            {
                                EXFG ()
                                Return (0x0F)
                            }
                            Else
                            {
                                If (LOr (IOAH, IOAL))
                                {
                                    EXFG ()
                                    Return (0x0D)
                                }
                                Else
                                {
                                    EXFG ()
                                    Return (0x00)
                                }
                            }
                        }
                        Else
                        {
                            EXFG ()
                            Return (0x00)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (0x03, LDN)
                        Store (Zero, ACTR)
                        SLDM (DMCH, 0x04)
                        EXFG ()
                        DISD (0x02)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF6, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                _Y06)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                _Y07)
                            IRQNoFlags (_Y08)
                                {}
                            DMA (Compatibility, NotBusMaster, Transfer8, _Y09)
                                {}
                        })
                        CreateByteField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y06._MIN, IOLO)
                        CreateByteField (BUF6, 0x03, IOHI)
                        CreateByteField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y06._MAX, IORL)
                        CreateByteField (BUF6, 0x05, IORH)
                        CreateByteField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y06._LEN, IOLE)
                        CreateByteField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y07._MIN, IOEL)
                        CreateByteField (BUF6, 0x0B, IOEH)
                        CreateByteField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y07._MAX, IOML)
                        CreateByteField (BUF6, 0x0D, IOMH)
                        CreateWordField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y08._INT, IRQW)
                        CreateByteField (BUF6, \_SB.PCI0.PX40.ECP1._CRS._Y09._DMA, DMAC)
                        ENFG ()
                        Store (0x03, LDN)
                        Store (IOAL, Local2)
                        Store (Local2, IOLO)
                        Store (IOAH, Local3)
                        Store (Local3, IOHI)
                        Or (Local3, 0x04, Local3)
                        Store (Local3, IOEH)
                        Store (Local3, IOMH)
                        Store (IOLO, IORL)
                        Store (IOLO, IOEL)
                        Store (IOLO, IOML)
                        Store (IOHI, IORH)
                        If (LEqual (IOLO, 0xBC))
                        {
                            Store (0x04, IOLE)
                        }
                        Else
                        {
                            Store (0x08, IOLE)
                        }

                        Store (One, Local0)
                        Store (INTR, Local5)
                        ShiftLeft (Local0, Local5, IRQW)
                        Store (One, Local0)
                        Store (DMCH, Local5)
                        ShiftLeft (Local0, Local5, DMAC)
                        EXFG ()
                        Return (BUF6)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0778,             // Range Minimum
                                0x0778,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0678,             // Range Minimum
                                0x0678,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IO (Decode16,
                                0x07BC,             // Range Minimum
                                0x07BC,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,3}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x02, IOAD)
                        CreateWordField (Arg0, 0x11, IRQW)
                        CreateByteField (Arg0, 0x14, DMAC)
                        ENFG ()
                        Store (0x03, LDN)
                        Store (One, ACTR)
                        Store (IOLO, IOAL)
                        Store (IOHI, IOAH)
                        FindSetLeftBit (IRQW, Local0)
                        Subtract (Local0, 0x01, Local0)
                        Store (Local0, INTR)
                        FindSetLeftBit (DMAC, Local1)
                        Store (DMCH, Local0)
                        Subtract (Local1, 0x01, DMCH)
                        SLDM (Local0, DMCH)
                        EXFG ()
                        CKIO (IOAD, 0x02)
                    }
                }

                OperationRegion (KBCT, SystemIO, 0x60, 0x05)
                Field (KBCT, ByteAcc, NoLock, Preserve)
                {
                    P060,   8, 
                            Offset (0x04), 
                    P064,   8
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (PS2F, 0x00))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF1, ResourceTemplate ()
                        {
                            IRQNoFlags ()
                                {12}
                        })
                        Name (BUF2, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0060,             // Range Minimum
                                0x0060,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IO (Decode16,
                                0x0064,             // Range Minimum
                                0x0064,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {12}
                        })
                        If (LEqual (KBDI, 0x01))
                        {
                            If (LEqual (OSFL, 0x02))
                            {
                                Return (BUF1)
                            }

                            If (LEqual (OSFL, 0x01))
                            {
                                Return (BUF1)
                            }
                            Else
                            {
                                Return (BUF2)
                            }
                        }
                        Else
                        {
                            Return (BUF1)
                        }
                    }
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (KBDI, 0x01))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (PSMR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x03)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (KBDI, 0x00))
                        {
                            Return (0x00)
                        }

                        If (LEqual (PS2F, 0x00))
                        {
                            If (LEqual (OSFL, 0x02))
                            {
                                Return (0x0F)
                            }

                            If (LEqual (OSFL, 0x01))
                            {
                                Return (0x0F)
                            }

                            Return (0x00)
                        }

                        Return (0x00)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (PMIO)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x02)
                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0400,             // Range Minimum
                                0x0400,             // Range Maximum
                                0x01,               // Alignment
                                0xD0,               // Length
                                )
                        })
                        Return (BUF0)
                    }
                }
            }

            Device (USB0)
            {
                Name (_ADR, 0x001D0000)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x03
                })
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0001)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x03
                })
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0002)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
            }

            Device (USB3)
            {
                Name (_ADR, 0x001D0003)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
            }

            Device (USBE)
            {
                Name (_ADR, 0x001D0007)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })

                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x04)
                    {
                        "AAPL,clock-id",
                        Buffer (One)
                        {
                            One
                        },

                        "device-type",
                        Buffer (0x05)
                        {
                            "EHCI"
                        }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Name (NATA, Package (0x01)
            {
                0x001F0001
            })
            Device (ICHX)
            {
                Name (_ADR, 0x001F0001)
                OperationRegion (PCI, PCI_Config, 0x40, 0x20)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                    ITM0,   16, 
                    ITM1,   16, 
                    SIT0,   4, 
                    SIT1,   4, 
                            Offset (0x08), 
                    UDC0,   2, 
                    UDC1,   2, 
                            Offset (0x0A), 
                    UDT0,   8, 
                    UDT1,   8, 
                            Offset (0x14), 
                    ICF0,   2, 
                    ICF1,   2, 
                        ,   6, 
                    WPPE,   1, 
                        ,   1, 
                    FAS0,   2, 
                    FAS1,   2
                }

                Method (GTM, 6, NotSerialized)
                {
                    Store (Buffer (0x14) {}, Local0)
                    CreateDWordField (Local0, 0x00, PIO0)
                    CreateDWordField (Local0, 0x04, DMA0)
                    CreateDWordField (Local0, 0x08, PIO1)
                    CreateDWordField (Local0, 0x0C, DMA1)
                    CreateDWordField (Local0, 0x10, FLAG)
                    Store (0x10, FLAG)
                    If (LOr (And (Arg0, 0x08), LNot (And (Arg0, 0x01
                        ))))
                    {
                        Store (0x0384, PIO0)
                    }
                    Else
                    {
                        Add (ShiftRight (And (Arg0, 0x0300), 0x08), ShiftRight (And (
                            Arg0, 0x3000), 0x0C), Local1)
                        Multiply (Subtract (0x09, Local1), 0x1E, PIO0)
                    }

                    If (LOr (LAnd (Arg0, 0x4000), LAnd (Arg2, 0x01)))
                    {
                        If (LOr (And (Arg0, 0x80), LNot (And (Arg0, 0x10
                            ))))
                        {
                            Store (0x0384, PIO1)
                        }
                        Else
                        {
                            Add (And (Arg1, 0x03), ShiftRight (And (Arg1, 0x0C), 
                                0x02), Local1)
                            Multiply (Subtract (0x09, Local1), 0x1E, PIO1)
                        }
                    }
                    Else
                    {
                        Store (PIO0, PIO1)
                    }

                    If (And (Arg2, 0x01))
                    {
                        Subtract (0x04, And (Arg3, 0x03), Local1)
                        If (And (Arg5, 0x01))
                        {
                            Store (0x14, DMA0)
                        }
                        Else
                        {
                            If (And (Arg4, 0x01))
                            {
                                Multiply (Local1, 0x0F, DMA0)
                            }
                            Else
                            {
                                Multiply (Local1, 0x1E, DMA0)
                            }
                        }
                    }
                    Else
                    {
                        Store (PIO0, DMA0)
                    }

                    If (LOr (LAnd (Arg0, 0x4000), LAnd (Arg2, 0x01)))
                    {
                        If (And (Arg2, 0x02))
                        {
                            Subtract (0x04, ShiftRight (And (Arg3, 0x30), 0x04), Local1)
                            If (And (Arg5, 0x02))
                            {
                                Store (0x14, DMA1)
                            }
                            Else
                            {
                                If (And (Arg4, 0x02))
                                {
                                    Multiply (Local1, 0x0F, DMA1)
                                }
                                Else
                                {
                                    Multiply (Local1, 0x1E, DMA1)
                                }
                            }
                        }
                        Else
                        {
                            Store (PIO1, DMA1)
                        }
                    }
                    Else
                    {
                        Store (DMA0, DMA1)
                    }

                    Store (Zero, FLAG)
                    If (And (Arg0, 0x01))
                    {
                        Or (FLAG, 0x10, FLAG)
                    }

                    If (And (Arg2, 0x01))
                    {
                        Or (FLAG, 0x01, FLAG)
                    }

                    If (And (Arg0, 0x02))
                    {
                        Or (FLAG, 0x02, FLAG)
                    }

                    If (And (Arg2, 0x02))
                    {
                        Or (FLAG, 0x04, FLAG)
                    }

                    If (And (Arg0, 0x20))
                    {
                        Or (FLAG, 0x08, FLAG)
                    }

                    Return (Local0)
                }

                Method (STM, 3, NotSerialized)
                {
                    Store (Buffer (0x18) {}, Local7)
                    CreateDWordField (Local7, 0x00, ITM)
                    CreateDWordField (Local7, 0x04, SIT)
                    CreateDWordField (Local7, 0x08, UDC)
                    CreateDWordField (Local7, 0x0C, UDT)
                    CreateDWordField (Local7, 0x10, ICF)
                    CreateDWordField (Local7, 0x14, FAS)
                    CreateDWordField (Arg0, 0x00, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Store (FLAG, Local4)
                    Store (0x8000, Local0)
                    If (And (Local4, 0x02))
                    {
                        Or (Local0, 0x07, Local0)
                    }

                    If (And (Local4, 0x08))
                    {
                        Or (Local0, 0x4000, Local0)
                        Or (Local0, 0x70, Local0)
                    }

                    If (LAnd (LLess (DMA0, PIO0), LNot (And (Local4, 0x01))))
                    {
                        Or (Local0, 0x08, Local0)
                    }

                    If (LAnd (LLess (DMA1, PIO1), LNot (And (Local4, 0x04))))
                    {
                        Or (Local0, 0x80, Local0)
                    }

                    If (PIO0)
                    {
                        If (LLess (PIO0, 0x0384))
                        {
                            Or (Local0, 0x01, Local0)
                        }
                    }

                    If (PIO1)
                    {
                        If (LLess (PIO1, 0x0384))
                        {
                            Or (Local0, 0x10, Local0)
                        }
                    }

                    If (And (Local4, 0x01))
                    {
                        Store (PIO0, Local1)
                    }
                    Else
                    {
                        Store (DMA0, Local1)
                    }

                    If (Local1)
                    {
                        If (LLessEqual (Local1, 0x78))
                        {
                            Or (Local0, 0x2300, Local0)
                        }
                        Else
                        {
                            If (LLessEqual (Local1, 0xB4))
                            {
                                Or (Local0, 0x2100, Local0)
                            }
                            Else
                            {
                                If (LLessEqual (Local1, 0xF0))
                                {
                                    Or (Local0, 0x1000, Local0)
                                }
                            }
                        }
                    }

                    Store (Local0, ITM)
                    Store (Zero, Local0)
                    If (And (Local4, 0x04))
                    {
                        Store (PIO1, Local1)
                    }
                    Else
                    {
                        Store (DMA1, Local1)
                    }

                    If (Local1)
                    {
                        If (LLessEqual (Local1, 0x78))
                        {
                            Store (0x0B, Local0)
                        }
                        Else
                        {
                            If (LLessEqual (Local1, 0xB4))
                            {
                                Store (0x09, Local0)
                            }
                            Else
                            {
                                If (LLessEqual (Local1, 0xF0))
                                {
                                    Store (0x04, Local0)
                                }
                            }
                        }
                    }

                    Store (Local0, SIT)
                    Store (0x00, Local0)
                    If (And (Local4, 0x01))
                    {
                        Or (Local0, 0x01, Local0)
                    }

                    If (And (Local4, 0x04))
                    {
                        Or (Local0, 0x02, Local0)
                    }

                    Store (Local0, UDC)
                    Store (0x00, Local0)
                    If (And (Local4, 0x01))
                    {
                        If (LEqual (DMA0, 0x14))
                        {
                            Store (0x01, Local0)
                        }
                        Else
                        {
                            If (LLess (DMA0, 0x3C))
                            {
                                Divide (DMA0, 0x0F, , Local1)
                            }
                            Else
                            {
                                Divide (DMA0, 0x1E, , Local1)
                            }

                            Subtract (0x04, Local1, Local0)
                        }
                    }

                    If (And (Local4, 0x04))
                    {
                        If (LEqual (DMA1, 0x14))
                        {
                            Store (0x01, Local1)
                        }
                        Else
                        {
                            If (LLess (DMA1, 0x3C))
                            {
                                Divide (DMA1, 0x0F, , Local1)
                            }
                            Else
                            {
                                Divide (DMA1, 0x1E, , Local1)
                            }

                            Subtract (0x04, Local1, Local1)
                        }

                        ShiftLeft (Local1, 0x04, Local1)
                        Or (Local0, Local1, Local0)
                    }

                    Store (Local0, UDT)
                    Store (0x00, Local0)
                    If (DMA0)
                    {
                        If (LGreater (DMA0, 0x14))
                        {
                            If (LLess (DMA0, 0x3C))
                            {
                                Or (Local0, 0x01, Local0)
                            }
                        }
                    }

                    If (DMA1)
                    {
                        If (LGreater (DMA1, 0x14))
                        {
                            If (LLess (DMA1, 0x3C))
                            {
                                Or (Local0, 0x02, Local0)
                            }
                        }
                    }

                    Store (Local0, ICF)
                    Store (0x00, Local0)
                    If (LEqual (DMA0, 0x14))
                    {
                        Or (Local0, 0x01, Local0)
                    }

                    If (LEqual (DMA1, 0x14))
                    {
                        Or (Local0, 0x02, Local0)
                    }

                    Store (Local0, FAS)
                    Return (Local7)
                }

                Method (H15P, 1, NotSerialized)
                {
                    Name (BUFF, Buffer (0x08)
                    {
                        /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                    })
                    Store (Arg0, Local0)
                    Store (BUFF, Local1)
                    Concatenate (Local0, Local1, Local7)
                    CreateWordField (Local7, 0x02, CYL)
                    CreateWordField (Local7, 0x06, HEAD)
                    CreateWordField (Local7, 0x0C, SPT)
                    If (LAnd (LGreaterEqual (HEAD, 0x10), LGreaterEqual (CYL, 0x2000)))
                    {
                        Return (SPT)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (GTF0, 7, NotSerialized)
                {
                    Store (Buffer (0x07)
                        {
                            0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                        }, Local7)
                    CreateByteField (Local7, 0x01, MODE)
                    If (And (Arg2, 0x01))
                    {
                        And (Arg3, 0x03, Local0)
                        If (And (Arg6, 0x01))
                        {
                            Add (Local0, 0x04, Local0)
                        }
                        Else
                        {
                            If (And (Arg4, 0x01))
                            {
                                Add (Local0, 0x02, Local0)
                            }
                        }

                        Or (Local0, 0x40, MODE)
                    }
                    Else
                    {
                        Add (ShiftRight (And (Arg0, 0x0300), 0x08), ShiftRight (And (
                            Arg0, 0x3000), 0x0C), Local0)
                        If (LGreaterEqual (Local0, 0x05))
                        {
                            Store (0x22, MODE)
                        }
                        Else
                        {
                            If (LGreaterEqual (Local0, 0x03))
                            {
                                Store (0x21, MODE)
                            }
                            Else
                            {
                                Store (0x20, MODE)
                            }
                        }
                    }

                    Concatenate (Local7, Local7, Local6)
                    If (LOr (And (Arg0, 0x08), LNot (And (Arg0, 0x01
                        ))))
                    {
                        If (And (Arg0, 0x02))
                        {
                            Store (0x00, MODE)
                        }
                        Else
                        {
                            Store (0x01, MODE)
                        }
                    }
                    Else
                    {
                        Add (ShiftRight (And (Arg0, 0x0300), 0x08), ShiftRight (And (
                            Arg0, 0x3000), 0x0C), Local0)
                        If (LGreaterEqual (Local0, 0x05))
                        {
                            Store (0x0C, MODE)
                        }
                        Else
                        {
                            If (LGreaterEqual (Local0, 0x03))
                            {
                                Store (0x0B, MODE)
                            }
                            Else
                            {
                                Store (0x0A, MODE)
                            }
                        }
                    }

                    Concatenate (Local6, Local7, Local5)
                    If (Arg5)
                    {
                        Store (Buffer (0x07)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00, 0xAE, 0x91
                            }, Local4)
                        CreateByteField (Local4, 0x01, SPT)
                        Store (Arg5, SPT)
                        Concatenate (Local5, Local4, Local6)
                        Return (Local6)
                    }
                    Else
                    {
                        Return (Local5)
                    }
                }

                Method (GTF1, 7, NotSerialized)
                {
                    Store (Buffer (0x07)
                        {
                            0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                        }, Local7)
                    CreateByteField (Local7, 0x01, MODE)
                    If (And (Arg2, 0x02))
                    {
                        ShiftRight (And (Arg3, 0x30), 0x04, Local0)
                        If (And (Arg6, 0x02))
                        {
                            Add (Local0, 0x04, Local0)
                        }
                        Else
                        {
                            If (And (Arg4, 0x02))
                            {
                                Add (Local0, 0x02, Local0)
                            }
                        }

                        Or (Local0, 0x40, MODE)
                    }
                    Else
                    {
                        Add (ShiftRight (And (Arg1, 0x03), 0x02), And (Arg1, 
                            0x0C), Local0)
                        If (LGreaterEqual (Local0, 0x05))
                        {
                            Store (0x22, MODE)
                        }
                        Else
                        {
                            If (LGreaterEqual (Local0, 0x03))
                            {
                                Store (0x21, MODE)
                            }
                            Else
                            {
                                Store (0x20, MODE)
                            }
                        }
                    }

                    Concatenate (Local7, Local7, Local6)
                    If (LOr (And (Arg0, 0x80), LNot (And (Arg0, 0x10
                        ))))
                    {
                        If (And (Arg0, 0x20))
                        {
                            Store (0x00, MODE)
                        }
                        Else
                        {
                            Store (0x01, MODE)
                        }
                    }
                    Else
                    {
                        Add (ShiftRight (And (Arg1, 0x03), 0x02), And (Arg1, 
                            0x0C), Local0)
                        If (LGreaterEqual (Local0, 0x05))
                        {
                            Store (0x0C, MODE)
                        }
                        Else
                        {
                            If (LGreaterEqual (Local0, 0x03))
                            {
                                Store (0x0B, MODE)
                            }
                            Else
                            {
                                Store (0x0A, MODE)
                            }
                        }
                    }

                    Concatenate (Local6, Local7, Local5)
                    If (Arg5)
                    {
                        Store (Buffer (0x07)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00, 0xBE, 0x91
                            }, Local4)
                        CreateByteField (Local4, 0x01, SPT)
                        Store (Arg5, SPT)
                        Concatenate (Local5, Local4, Local6)
                        Return (Local6)
                    }
                    Else
                    {
                        Return (Local5)
                    }
                }

                Device (PRIM)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (GTM (ITM0, SIT0, UDC0, UDT0, ICF0, FAS0), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (STM (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, 0x00, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        Store (UDC, UDC0)
                        Store (UDT, UDT0)
                        Store (ICF, ICF0)
                        Store (FAS, FAS0)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (GTF0 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0), Local0)
                            Return (Local0)
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (GTF1 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0), Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECN)
                {
                    Name (_ADR, 0x01)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (GTM (ITM1, SIT1, UDC1, UDT1, ICF1, FAS1), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (STM (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, 0x00, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        Store (UDC, UDC1)
                        Store (UDT, UDT1)
                        Store (ICF, ICF1)
                        Store (FAS, FAS1)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (GTF0 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1), Local0)
                            Return (Local0)
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (GTF1 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1), Local0)
                            Return (Local0)
                        }
                    }
                }
            }

            Device (IDE1)
            {
                Name (_ADR, 0x001F0002)
                OperationRegion (PCI, PCI_Config, 0x40, 0x20)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                    ITM0,   16, 
                    ITM1,   16, 
                    SIT0,   4, 
                    SIT1,   4, 
                            Offset (0x08), 
                    UDC0,   2, 
                    UDC1,   2, 
                            Offset (0x0A), 
                    UDT0,   8, 
                    UDT1,   8, 
                            Offset (0x14), 
                    ICF0,   2, 
                    ICF1,   2, 
                        ,   6, 
                    WPPE,   1, 
                        ,   1, 
                    FAS0,   2, 
                    FAS1,   2
                }

                Device (PRIM)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (\_SB.PCI0.ICHX.GTM (ITM0, SIT0, UDC0, UDT0, ICF0, FAS0), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (\_SB.PCI0.ICHX.STM (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, 0x00, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        Store (UDC, UDC0)
                        Store (UDT, UDT0)
                        Store (ICF, ICF0)
                        Store (FAS, FAS0)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, 0x00)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (\_SB.PCI0.ICHX.GTF0 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0), Local0)
                            Return (Local0)
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, 0x01)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (\_SB.PCI0.ICHX.GTF1 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0), Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (\_SB.PCI0.ICHX.GTM (ITM1, SIT1, UDC1, UDT1, ICF1, FAS1), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (\_SB.PCI0.ICHX.STM (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, 0x00, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        Store (UDC, UDC1)
                        Store (UDT, UDT1)
                        Store (ICF, ICF1)
                        Store (FAS, FAS1)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, 0x00)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (\_SB.PCI0.ICHX.GTF0 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1), Local0)
                            Return (Local0)
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, 0x01)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (\_SB.PCI0.ICHX.GTF1 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1), Local0)
                            Return (Local0)
                        }
                    }
                }
            }

            Device (PX43)
            {
                Name (_ADR, 0x001F0003)
                OperationRegion (PBAS, PCI_Config, 0x20, 0x02)
                Field (PBAS, ByteAcc, NoLock, Preserve)
                {
                    BAS0,   16
                }

                Method (SMBB, 0, NotSerialized)
                {
                    And (BAS0, 0xFFFE, Local0)
                    Return (Local0)
                }

                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x04)
                    {
                        "name",
                        "pci8086,3a30",
                        "device-id",
                        Buffer (0x04)
                        {
                            0x30, 0x3a, 0x00, 0x00
                        }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (AZAL)
            {
                Name (_ADR, 0x001B0000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x05, 
                        0x05
                    })
                }
            }

            Name (BUFA, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11,12,14,15}
            })
            Name (BUFB, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, _Y0A)
                    {}
            })
            CreateWordField (BUFB, \_SB.PCI0._Y0A._INT, IRQV)
            Device (LNKA)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x01)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRA, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRA, 0x80, PIRA)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRA, 0x0F, Local0)
                    ShiftLeft (0x01, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRA)
                }
            }

            Device (LNKB)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x02)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRB, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRB, 0x80, PIRB)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRB, 0x0F, Local0)
                    ShiftLeft (0x01, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRB)
                }
            }

            Device (LNKC)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x03)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRC, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRC, 0x80, PIRC)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRC, 0x0F, Local0)
                    ShiftLeft (0x01, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRC)
                }
            }

            Device (LNKD)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x04)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRD, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRD, 0x80, PIRD)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRD, 0x0F, Local0)
                    ShiftLeft (0x01, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRD)
                }
            }

            Device (LNKE)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x05)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRE, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRE, 0x80, PIRE)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRE, 0x0F, Local0)
                    ShiftLeft (0x01, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRE)
                }
            }

            Device (LNKF)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x06)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRF, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRF, 0x80, PIRF)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRF, 0x0F, Local0)
                    ShiftLeft (0x01, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRF)
                }
            }

            Device (LNK0)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x07)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRG, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRG, 0x80, PIRG)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRG, 0x0F, Local0)
                    ShiftLeft (0x01, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRG)
                }
            }

            Device (LNK1)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x08)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRH, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRH, 0x80, PIRH)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRH, 0x0F, Local0)
                    ShiftLeft (0x01, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, 0x01, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRH)
                }
            }

            Method (_PRW, 0, NotSerialized)
            {
                Return (Package (0x02)
                {
                    0x0B, 
                    0x05
                })
            }
        }

        Device (MEM)
        {
            Name (_HID, EisaId ("PNP0C01"))
            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x000F0000,         // Address Base
                        0x00004000,         // Address Length
                        _Y0C)
                    Memory32Fixed (ReadWrite,
                        0x000F4000,         // Address Base
                        0x00004000,         // Address Length
                        _Y0D)
                    Memory32Fixed (ReadWrite,
                        0x000F8000,         // Address Base
                        0x00004000,         // Address Length
                        _Y0E)
                    Memory32Fixed (ReadWrite,
                        0x000FC000,         // Address Base
                        0x00004000,         // Address Length
                        _Y0F)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00010000,         // Address Length
                        _Y0B)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x000A0000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00100000,         // Address Base
                        0x00000000,         // Address Length
                        _Y11)
                    Memory32Fixed (ReadWrite,
                        0xFEC00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED13000,         // Address Base
                        0x0000B000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00070000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEE00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFFB00000,         // Address Base
                        0x00080000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFFF00000,         // Address Base
                        0x00100000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x000E0000,         // Address Base
                        0x00010000,         // Address Length
                        _Y10)
                })
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0B._BAS, ACMM)
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0B._LEN, ASSM)
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0C._BAS, RMA1)
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0C._LEN, RSS1)
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0D._BAS, RMA2)
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0D._LEN, RSS2)
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0E._BAS, RMA3)
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0E._LEN, RSS3)
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0F._BAS, RMA4)
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y0F._LEN, RSS4)
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y10._BAS, ERMA)
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y10._LEN, ERMS)
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y11._LEN, EXTM)
                Subtract (AMEM, 0x00100000, EXTM)
                If (LNotEqual (ROM1, Zero))
                {
                    Store (RMA1, RMA2)
                    ShiftLeft (ROM1, 0x08, Local0)
                    Store (Local0, RMA1)
                    ShiftLeft (RMS1, 0x08, Local0)
                    Store (Local0, RSS1)
                    Store (0x8000, RSS2)
                }

                If (LNotEqual (ROM2, Zero))
                {
                    Store (RMA2, RMA3)
                    ShiftLeft (ROM2, 0x08, Local0)
                    Store (Local0, RMA2)
                    ShiftLeft (RMS2, 0x08, Local0)
                    Store (Local0, RSS2)
                    Store (0xC000, RSS3)
                }

                If (LNotEqual (ROM3, Zero))
                {
                    Store (RMA3, RMA4)
                    ShiftLeft (ROM3, 0x08, Local0)
                    Store (Local0, RMA3)
                    ShiftLeft (RMS3, 0x08, Local0)
                    Store (Local0, RSS3)
                    Store (0x00010000, RSS4)
                }

                Store (ERMA, Local1)
                If (LGreater (RMA1, 0x000D0000))
                {
                    If (LLess (RMA1, 0x000F0000))
                    {
                        Add (RMA1, RSS1, Local0)
                        If (LGreater (Local0, 0x000E0000))
                        {
                            If (LGreater (Local0, Local1))
                            {
                                Store (Local0, Local1)
                            }
                        }
                    }
                }

                If (LGreater (RMA2, 0x000D0000))
                {
                    If (LLess (RMA2, 0x000F0000))
                    {
                        Add (RMA2, RSS2, Local0)
                        If (LGreater (Local0, 0x000E0000))
                        {
                            If (LGreater (Local0, Local1))
                            {
                                Store (Local0, Local1)
                            }
                        }
                    }
                }

                If (LGreater (RMA3, 0x000D0000))
                {
                    If (LLess (RMA3, 0x000F0000))
                    {
                        Add (RMA3, RSS3, Local0)
                        If (LGreater (Local0, 0x000E0000))
                        {
                            If (LGreater (Local0, Local1))
                            {
                                Store (Local0, Local1)
                            }
                        }
                    }
                }

                If (LGreater (Local1, ERMA))
                {
                    Subtract (Local1, ERMA, Local0)
                    If (LLessEqual (Local0, 0x00010000))
                    {
                        Store (Local1, ERMA)
                        Subtract (0x00010000, Local0, ERMS)
                    }
                }

                Store (AMEM, ACMM)
                And (AMEM, 0x000FFFFF, Local0)
                Subtract (0x00100000, Local0, ASSM)
                Return (BUF0)
            }
        }

        Device (FWH)
        {
            Name (_HID, EisaId ("INT0800"))
            Method (_CRS, 0, NotSerialized)
            {
                Name (FWH0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFFB80000,         // Address Base
                        0x00080000,         // Address Length
                        )
                })
                Return (FWH0)
            }
        }

        Device (\_SB.PCI0.EXPL)
        {
            Name (_HID, EisaId ("PNP0C02"))
            Name (_UID, 0x04)
            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xE0000000,         // Address Base
                        0x10000000,         // Address Length
                        )
                })
                Return (BUF0)
            }
        }
    }
}

