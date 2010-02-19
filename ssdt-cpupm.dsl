DefinitionBlock ("SSDT_v01-PmRef-CpuPm-00003000-INTL-20040311.aml", "SSDT", 1, "PmRef", "CpuPm", 0x00003000)
{
    External (\_PR_.CPU3, DeviceObj)
    External (\_PR_.CPU2, DeviceObj)
    External (\_PR_.CPU1, DeviceObj)
    External (\_PR_.CPU0, DeviceObj)

    Scope (\)
    {
        Name (SSDT, Package (0x18)
        {
            "CPU0IST ", 
            0xCFEED720, 
            0x0000026C, 
            "CPU1IST ", 
            0xCFEEDBE0, 
            0x00000152, 
            "CPU0CST ", 
            0x00000000, 
            0xF000E816, 
            "CPU1CST ", 
            0x00000000, 
            0xF000E816, 
            "CPU2IST ", 
            0x00000000, 
            0xF000E816, 
            "CPU3IST ", 
            0x00000000, 
            0xF000E816, 
            "CPU2CST ", 
            0x00000000, 
            0xF000E816, 
            "CPU3CST ", 
            0x00000000, 
            0xF000E816
        })
        Name (CFGD, 0x02030302)
        Name (\PDC0, 0x80000000)
        Name (\PDC1, 0x80000000)
        Name (\PDC2, 0x80000000)
        Name (\PDC3, 0x80000000)
    }

    Scope (\_PR.CPU0)
    {
        Name (HI0, 0x00)
        Name (HC0, 0x00)
        Name (TLD0, 0x00)
        Method (_PDC, 1, NotSerialized)
        {
            CreateDWordField (Arg0, 0x08, CAP0)
            Store (CAP0, PDC0)
            If (LEqual (TLD0, 0x00))
            {
                If (LEqual (And (PDC0, 0x0A), 0x0A))
                {
                    If (And (CFGD, 0x02))
                    {
                        OperationRegion (IST0, SystemMemory, DerefOf (Index (SSDT, 0x01)), DerefOf (Index (SSDT, 0x02
                            )))
                        Load (IST0, HI0)
                    }

                    Store (0x01, TLD0)
                }
            }
        }
    }

    Scope (\_PR.CPU1)
    {
        Name (HI1, 0x00)
        Name (HC1, 0x00)
        Name (TLD1, 0x00)
        Method (_PDC, 1, NotSerialized)
        {
            CreateDWordField (Arg0, 0x08, CAP1)
            Store (CAP1, PDC1)
            If (LEqual (TLD1, 0x00))
            {
                If (LEqual (And (PDC1, 0x0A), 0x0A))
                {
                    If (And (CFGD, 0x02))
                    {
                        OperationRegion (IST1, SystemMemory, DerefOf (Index (SSDT, 0x04)), DerefOf (Index (SSDT, 0x05
                            )))
                        Load (IST1, HI1)
                    }

                    If (And (CFGD, 0x10))
                    {
                        OperationRegion (CST1, SystemMemory, DerefOf (Index (SSDT, 0x0A)), DerefOf (Index (SSDT, 0x0B
                            )))
                        Load (CST1, HC1)
                    }

                    Store (0x01, TLD1)
                }
            }
        }
    }

    Scope (\_PR.CPU2)
    {
        Name (HI2, 0x00)
        Name (HC2, 0x00)
        Name (TLD2, 0x00)
        Method (_PDC, 1, NotSerialized)
        {
            CreateDWordField (Arg0, 0x08, CAP2)
            Store (CAP2, PDC2)
            If (LEqual (TLD2, 0x00))
            {
                If (LEqual (And (PDC2, 0x0A), 0x0A))
                {
                    If (And (CFGD, 0x02))
                    {
                        OperationRegion (IST2, SystemMemory, DerefOf (Index (SSDT, 0x0D)), DerefOf (Index (SSDT, 0x0E
                            )))
                        Load (IST2, HI2)
                    }

                    If (And (CFGD, 0x10))
                    {
                        OperationRegion (CST2, SystemMemory, DerefOf (Index (SSDT, 0x13)), DerefOf (Index (SSDT, 0x14
                            )))
                        Load (CST2, HC2)
                    }

                    Store (0x01, TLD2)
                }
            }
        }
    }

    Scope (\_PR.CPU3)
    {
        Name (HI3, 0x00)
        Name (HC3, 0x00)
        Name (TLD3, 0x00)
        Method (_PDC, 1, NotSerialized)
        {
            CreateDWordField (Arg0, 0x08, CAP3)
            Store (CAP3, PDC3)
            If (LEqual (TLD3, 0x00))
            {
                If (LEqual (And (PDC3, 0x0A), 0x0A))
                {
                    If (And (CFGD, 0x02))
                    {
                        OperationRegion (IST3, SystemMemory, DerefOf (Index (SSDT, 0x10)), DerefOf (Index (SSDT, 0x11
                            )))
                        Load (IST3, HI3)
                    }

                    If (And (CFGD, 0x10))
                    {
                        OperationRegion (CST3, SystemMemory, DerefOf (Index (SSDT, 0x16)), DerefOf (Index (SSDT, 0x17
                            )))
                        Load (CST3, HC3)
                    }

                    Store (0x01, TLD3)
                }
            }
        }
    }
}

