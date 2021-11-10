with Ada.Text_IO; -- always need these two lines for reading and printing
use Ada.Text_IO;
with sorting;
use sorting;
procedure mainprog is


    task PrintingTask is
        entry proceed;
        entry proceed2;
        entry sum(S:Integer);
    end PrintingTask;

    task SortingTask is
    entry proceed;
    end SortingTask;

    task AddingTask is
        entry proceed;
    end AddingTask;

    task body PrintingTask is
    begin
        accept proceed;
        for I in 0..SIZE-1 loop
        Put (My_Integer'Image (Arr(I)));
        end loop;
        New_Line;
        SortingTask.proceed;

        accept proceed2;
        for I in 0..SIZE-1 loop
        Put (My_Integer'Image (Arr(I)));
        end loop;
        New_Line;

        accept sum(S:Integer) do
            Put(Integer'Image(S));
        end sum;

    end PrintingTask;


    task body SortingTask is
    begin
        accept proceed;
        Qsort (0, SIZE-1);
        PrintingTask.proceed2;
        AddingTask.proceed;
    end SortingTask;


    task body AddingTask is
        sum: Integer := 0;
    begin
        accept proceed;
        for i in 0..SIZE-1 loop
            sum := sum + Arr(i);
        end loop;
        PrintingTask.sum(sum);
    end AddingTask;



begin
    Put("Please enter the numbers"); New_Line;
    for i in 0..SIZE-1 loop
        Arr(i) := My_Integer'Value(Get_Line);
    end loop;
    PrintingTask.proceed;

end mainprog;