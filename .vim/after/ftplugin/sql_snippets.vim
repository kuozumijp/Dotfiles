if !exists('loaded_snippet') || &cp 
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet sql CREATE OR REPLACE PACKAGE ".st.et." ".st."PackageName".et." IS<CR>----------------------------------------------------------------------<CR>-- $Id$<CR>--【".st."PropatyName".et."】".st."Title".et."<CR>--<CR>-- パッケージ名：".st."PackageName".et."<CR>--<CR>-- 更新履歴<CR>--  ".TODAY." ".AUTHOR." 新規作成<CR>--<CR>-- Copyright (C) ".COPYRIGHT.". All Rights Reserved.<CR>----------------------------------------------------------------------<CR>".st.et
exec "Snippet sele SELECT<CR><TAB>".st.et."<CR>FROM<CR><TAB>".st."TableName".et."<CR>WHERE<CR><TAB>".st.et.";<CR>".st.et
exec "Snippet up UPDATE<CR><TAB>".st."TableName".et."<CR>SET<CR><TAB>".st."Coulm".et." = ".st."Value".et."<CR>WHERE<CR><TAB>".st.et.";<CR>".st.et
exec "Snippet del DELETE FROM<CR><TAB>".st."TableName".et."<CR>WHERE<CR><TAB>".st.et.";<CR>".st.et
exec "Snippet ins INSERT INTO ".st."TableName".et."<CR><TAB>(".st.et.")<CR>VALUES<CR><TAB>(".st.et.");<CR>".st.et
exec "Snippet if IF ".st."Condition".et." THEN<CR><TAB>".st.et."<CR>END IF;<CR>".st.et
exec "Snippet ifelse IF ".st."Condition".et." THEN<CR><TAB>".st.et."<CR>ELSE<CR><TAB>".st.et."<CR>END IF;<CR>".st.et
exec "Snippet elsif ELSIF ".st."Condition".et." THEN<CR><TAB>".st.et
exec "Snippet for FOR ".st.et." IN ".st.et."<CR><TAB>".st.et."<CR>END LOOP;<CR>".st.et
