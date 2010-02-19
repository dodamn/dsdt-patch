DefinitionBlock ("SSDT_v01-PmRef-Cpu1Ist-00003000-INTL-20040311.aml", "SSDT", 1, "PmRef", "Cpu1Ist", 0x00003000)
{
    External (CFGD)
    External (\_PR_.CPU1, DeviceObj)
    External (\_PR_.CPU0._PSS, IntObj)

    Scope (\_PR.CPU1)
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
            Return (\_PR.CPU0._PSS)
        }
    }
}

