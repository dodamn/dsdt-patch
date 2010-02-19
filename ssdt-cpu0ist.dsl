DefinitionBlock ("SSDT_v01-PmRef-Cpu0Ist-00003000-INTL-20040311.aml", "SSDT", 1, "PmRef", "Cpu0Ist", 0x00003000)
{
    External (CFGD)
    External (\_PR_.CPU0, DeviceObj)

    Scope (\_PR.CPU0)
    {
        Method (_PPC, 0, NotSerialized)
        {
            Return (0x00)
        }

        Method (_PCT, 0, NotSerialized)
        {
            If (LEqual (And (CFGD, 0x00060000), 0x00020000))
            {
                Return (Package (0x02)
                {
                    ResourceTemplate ()
                    {
                        Register (SystemIO, 
                            0x10,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000880, // Address
                            ,)
                    }, 

                    ResourceTemplate ()
                    {
                        Register (SystemIO, 
                            0x10,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000882, // Address
                            ,)
                    }
                })
            }

            If (LEqual (And (CFGD, 0x00060000), 0x00040000))
            {
                Return (Package (0x02)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }
                })
            }

            If (LOr (And (CFGD, 0x4000), And (CFGD, 0x00010000)))
            {
                Return (Package (0x02)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }
                })
            }

            Return (Package (0x02)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x10,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000880, // Address
                        ,)
                }, 

                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x10,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000882, // Address
                        ,)
                }
            })
        }

        Method (_PSS, 0, NotSerialized)
        {
            If (LEqual (And (CFGD, 0x00060000), 0x00020000))
            {
                Return (SPSS)
            }

            If (LEqual (And (CFGD, 0x00060000), 0x00040000))
            {
                Return (NPSS)
            }

            If (LOr (And (CFGD, 0x4000), And (CFGD, 0x00010000)))
            {
                Return (NPSS)
            }

            Return (SPSS)
        }

        Name (SPSS, Package (0x03)
        {
            Package (0x06)
            {
                0x00000AF0, 
                0x000157C0, 
                0x000000A0, 
                0x0000000A, 
                0x00000036, 
                0x00000000
            }, 

            Package (0x06)
            {
                0x00000855, 
                0x000109A0, 
                0x000000A0, 
                0x0000000A, 
                0x00000136, 
                0x00000001
            }, 

            Package (0x06)
            {
                0x00000640, 
                0x0000C738, 
                0x000000A0, 
                0x0000000A, 
                0x00000236, 
                0x00000002
            }
        })
        Name (NPSS, Package (0x03)
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

