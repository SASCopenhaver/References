create or replace function f_convertStringToListOfVals(arg_String IN VARCHAR2)
  Result RETURN vcarray PIPELINED
is
begin

    WHILE(v_start <= v_length)
    LOOP
        v_index := INSTR(arg_String, v_delimiter, v_start);
        IF v_index = 0 THEN
            PIPE ROW(SUBSTR(arg_String, v_start));
            v_start := v_length + 1;
        ELSE
            PIPE ROW(SUBSTR(arg_String, v_start, v_index - v_start));
            v_start := v_index + 1;
        END IF;
    END LOOP;

   RETURN;
end f_convertStringToListOfVals;
/
