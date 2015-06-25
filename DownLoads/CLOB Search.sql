select C.*, dbms_lob.instr(textfield, 'er', 1, 1) as Position
from clobtest C
where dbms_lob.instr(C.textfield, 'er', 1, 1) > 0




http://www.akadia.com/services/read_file_with_dbms_lob.html