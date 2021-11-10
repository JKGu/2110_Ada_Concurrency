with Ada.Text_IO; -- always need these two lines for reading and printing
use Ada.Text_IO;

package body sorting is
    procedure Qsort(Low,High: Integer) is

        function Partition(Low,High:Integer) return Integer is
            i: Integer := Low - 1;
            Pivot: My_Integer := Arr(High);
            tmp: My_Integer;
        begin
            for j in Low .. High-1 loop
                if Arr(j) <= Pivot then
                    i := i + 1;
                    tmp := Arr(i);
                    Arr(i) := Arr(j);
                    Arr(j) := tmp;
                end if;
            end loop;
            tmp := Arr(i+1);
            Arr(i+1) := Arr(High);
            Arr(High) := tmp;
            return i+1;
        end Partition;

    Pivot_Index: Integer;

    task Partition1 is
        entry Go(p:Integer);
        entry Stop;
    end;
    task body Partition1 is
    begin
    select
        accept Go(p:Integer) do
            Qsort (Low, p-1);
        end;
    or  accept Stop;
    end select;
    end;

    task Partition2 is
        entry Go(p:Integer);
        entry Stop;
    end;
    task body Partition2 is
    begin
    select
        accept Go(p:Integer) do
            Qsort (p+1, High);
        end;
    or accept Stop;
    end select;
    end;

    begin
        if Low < High then
            Pivot_Index := Partition (Low, High);
            Partition1.Go (Pivot_Index);
            Partition2.Go (Pivot_Index);
        else
            Partition1.Stop;
            Partition2.Stop;
        end if;
    end Qsort;
end sorting;
