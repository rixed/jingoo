open Jg_types

let compiled = ref false
let file = ref "cheatsheet.tmpl"
  
let () =
  Arg.parse [
    ("-cmpl", Arg.Unit (fun () -> compiled := true), "use compiled template");
    ("-tmpl", Arg.String (fun f -> file := f), "template name");
  ] ignore "";

  let result_string = 
    Jg_template.from_file !file ~use_compiled:(!compiled) ~models:Test_data.models in

  print_endline result_string
;;
