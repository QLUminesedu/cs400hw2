(* flag defaults *)
let filename = ref "";; (* TODO - this will always be set *)
let out_file = ref (None : string option)

let banner_text = "Welcome to javascript_ v. 1.0";;
let usage_msg = banner_text^"\n"^
                "Usage: javascript_ [options] <file>";;

type assignment = Hw02 ;;
let all_assignments = [Hw02]
let get_assignment name = match name with
| "hw02" -> Hw02
| _ -> failwith (Printf.sprintf "get_assignment_name: unknown assignment: %s" name)
let get_assignment_name a = match a with
| Hw02 -> "hw02"
let get_assignment_desc a = match a with
| Hw02 -> "Homework #2"

let test = ref (false : bool)
let mode = ref ([] : assignment list)

(* parse the command-line arguments *)
let args = Arg.align [
   ("-o",        Arg.String(fun x -> out_file := Some(x)),
                    "<file> Location for the result");
   ("-test",        Arg.Unit(fun () -> test := true),
                    " Run unit tests");
   ("-all",        Arg.Unit(fun () -> mode := all_assignments),
                    " All assignments")
] @ (List.rev (List.fold_left (fun acc a ->
   ("-"^(get_assignment_name a),        Arg.Unit(fun () -> mode := !mode @ [a]),
                    " "^(get_assignment_desc a)) :: acc
) [] all_assignments));;

let error_usage_msg () =
   Arg.usage args usage_msg;
   exit 1
;;

(* dies with a system error s *)
let die_system_error (s : string) =
   output_string stderr s;
   output_string stderr "\n";
   exit 1
;;

let parse_command_line () : in_channel option =
   let f_set = ref false in
   Arg.parse args (fun x -> f_set := true; filename := x) banner_text;
   (* use the command-line filename if one exists, otherwise use stdin *)
   match (!f_set,!mode) with
   | false,[] -> (*Some(error_usage_msg ())*)None
   | false,_ -> None
   | true,_ -> (
      try (Some(open_in !filename))
      with Sys_error(_) -> die_system_error ("can't read from file: "^(!filename))
   )
;;
