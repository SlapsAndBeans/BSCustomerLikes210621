tableextension 50200 "BSCL Book" extends "BSB Book"
{
    fields
    {
        field(50200; "BSCL No. of Customer Likes"; Integer)
        {
            Caption = 'No. of Customer Likes';
            Editable = false;
            FieldClass = FlowField;
            // Erst das Ziel, dann die Quelle
            CalcFormula = count(Customer where("BSB Favorite Book No." = field("No.")));
        }
    }

    procedure ShowCard()
    begin
        Page.Run(Page::"BSB Book Card", Rec);
    end;
}