codeunit 50200 "BSCL Subscriber Store"
{
    var
        OnDeleteBookErr: Label 'You are not allowed to delete %1 %2 because it is liked by one or mor customers';

    [EventSubscriber(ObjectType::Table, Database::"BSB Book", 'OnBeforeDeleteBook', '', true, true)]
    local procedure OnBeforeDeleteBook(Rec: Record "BSB Book"; var Handled: Boolean)
    var
        Customer: Record Customer;
    begin
        if Handled then
            exit;
        Customer.SetCurrentKey("BSB Favorite Book No.");
        Customer.SetRange("BSB Favorite Book No.", Rec."No.");
        if not Customer.IsEmpty() then
            error(OnDeleteBookErr, Rec.TableCaption, Rec."No.");
        Handled := true;
    end;
}