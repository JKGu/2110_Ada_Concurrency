package sorting is
    SIZE: integer:=40;
    subtype My_Integer is Integer range 0 .. 500;
    type My_Int_Array is array(0..SIZE-1) of My_Integer;
    Arr: My_Int_Array;
    procedure Qsort(Low,High: Integer);
end sorting;