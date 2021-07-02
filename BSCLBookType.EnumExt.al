enumextension 50200 "BSCL Book Type" extends "BSB Book Type"
{
    value(50200; eBook)
    {
        Caption = 'E-Book';
        Implementation = "BSB Book Type Evaluation" = "BSCL Book Type eBook Impl.";
    }
}