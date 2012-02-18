if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet elseif elseif (".st."condition".et."){<CR><Tab>".st.et."<CR>}<CR>".st.et
exec "Snippet do do{<CR><Tab>".st.et."<CR><CR>} while (".st.et.");<CR>".st.et
exec "Snippet if? $".st."retVal".et." = ( ".st."condition".et." ) ? ".st."a".et." : ".st."b".et." ;<CR>".st.et
exec "Snippet php <?php<CR>/**<CR> * ".st."Title".et."<CR> *<CR> * @version $Id$<CR> *<CR> * @author ".AUTHOR." <".MAILADDRESS."><CR> * @since ".TODAY."<CR> *  @copyright Copyright (C) ".COPYRIGHT.". All Rights Reserved.<CR> */<CR><CR>".st.et."<CR><CR>?>"
exec "Snippet switch switch (".st."variable".et."){<CR><Tab>case '".st."variable".et."':<CR><Tab>".st.et."<CR><Tab>break;<CR><CR>".st.et."<CR><CR>default:<CR><Tab>".st.et."<CR><Tab>break;<CR>}<CR>".st.et
exec "Snippet class class ".st."ClassName".et." ".st.et."<CR>{<CR><Tab>/** internal variables */<CR><CR><Tab>/**<CR><Tab> * Constructor<CR><Tab> *<CR><Tab> * @param ".st.et." ".st.et."<CR><Tab> * @access ".st."AccessControl".et."<CR><Tab> */<CR><Tab>".st."AccessControl".et." function __construct(".st.et.")<CR><Tab>{<CR><Tab><Tab>".st.et."<CR><Tab>}<CR><CR><Tab>".st.et."<CR><CR>}<CR>"
exec "Snippet incll /**<CR> * ".st.et."<CR> */<CR>include_once '".st."file".et."';<CR>".st.et
exec "Snippet incl /**<CR> * ".st.et."<CR> */<CR>include '".st."file".et."';<CR>".st.et
exec "Snippet foreach foreach($".st."variable".et." as $".st."key".et." => $".st."value".et."){<CR><Tab>".st.et."<CR>}<CR>".st.et
exec "Snippet ifelse if(".st."condition".et."){<CR><Tab>".st.et."<CR>}else{<CR><Tab>".st.et."<CR>}<CR>".st.et
exec "Snippet $_ $_REQUEST['".st."variable".et."']<CR>".st.et
exec "Snippet case case '".st."variable".et."':<CR><Tab>".st.et."<CR><Tab>break;<CR>".st.et
exec "Snippet print print \"".st."string".et."\"".st.et.";".st.et."<CR>".st.et
exec "Snippet func /**<CR> * ".st.et."<CR> *<CR> * @param ".st.et." ".st.et."<CR> * @return ".st.et." ".st.et."<CR> * @access ".st."AccessControl".et."<CR> */<CR>".st."AccessControl".et." function ".st."FunctionName".et."(".st.et.")<CR>{<CR><Tab>".st.et."<CR>}<CR>".st.et
exec "Snippet if if(".st."condition".et."){<CR><Tab>".st.et."<CR>}<CR>".st.et
exec "Snippet else else{<CR><Tab>".st.et."<CR>}<CR>".st.et
exec "Snippet array $".st."arrayName".et." = array('".st.et."',".st.et.");".st.et
exec "Snippet -globals $GLOBALS['".st."variable".et."']".st.et.st."something".et.st.et.";<CR>".st.et
exec "Snippet req /**<CR> * ".st.et."<CR> */<CR>require '".st."file".et."';<CR>".st.et
exec "Snippet reql /**<CR> * ".st.et."<CR> */<CR>require_once '".st."file".et."';<CR>".st.et
exec "Snippet for for($".st."i".et."=".st.et."; $".st."i".et." < ".st.et."; $".st."i".et."++){<CR><Tab>".st.et."<CR>}<CR>".st.et
exec "Snippet while while(".st.et."){<CR><Tab>".st.et."<CR>}<CR>".st.et
