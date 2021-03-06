open Javascript_ast
open Javascript_main
open Testing

(***********************************************************)
(** (simplified) abstract data type (ADT) for sheet music **)
(***********************************************************)

type name = string
type duration = int

type symbol =
  | Note of name * duration
  | Rest of duration

(* convert symbol to string *)
let rec str_symbol = fun s -> match s with
| Note(name,d) -> Printf.sprintf "Note(%s,%d)" name d
| Rest(d) -> Printf.sprintf "Rest(%d)" d

(* simple examples *)
let x = Note("A", 1)
let y = Rest(2)
let z = Note("A", 123)

(* function to extract the duration from an element
   on the page of sheet music *)
let get_duration = fun x -> match x with
    | Note(name, duration) -> duration
    | Rest(duration) -> duration

let d = get_duration y (* gets the value 2 *)

(**************************)
(** sheet music ADT tests *)
(**************************)

let simple_sheet_music_tests = ("Sheet Music", get_duration, (=), eq_exn, Some(str_symbol,string_of_int), [
  (Some("basic test"), Rest(2), Ok(2))
  
])

let sheet_music_tests = ("Sheet Music", get_duration, (=), eq_exn, Some(str_symbol,string_of_int), [
  (Some("unit test1"), Rest(3), Ok(3)); 
  (Some("unit test2"), Note("78", 4), Ok(4));
  (Some("unit test3"), Note("cs", 50), Ok(50));
  (Some("unit test4"), Note("c", 2), Ok(2));
  (Some("unit test5"), Rest(10), Ok(10))
])

(* NOTE - you can run your own tests like this: *)
(*let _ = run_tests sheet_music_tests*)


(*****************************************)
(** abstract data type for binary trees **)
(*****************************************)

type data = int

type tree =
  | Node of tree * data * tree
  | Leaf of data

(* convert tree to string *)
let rec str_tree = fun t -> match t with
| Node(l,d,r) -> Printf.sprintf "Node(%s,%d,%s)" (str_tree l) d (str_tree r)
| Leaf(d) -> Printf.sprintf "Leaf(%d)" d

(* convert int list to string *)
let str_int_list = fun l -> str_x_list string_of_int l ", "

(* in-order traversal of binary tree *)
(* "unit" type for functions that don't return anything *)
let rec traverse = fun t -> match t with
  | Node(l, d, r) -> (
    traverse l;
    print_int d;
    traverse r
  )
  | Leaf(d) -> print_int d

(* returns the proper order for the In-Order traversal (as a list) *)
let rec traverse2 = fun t -> match t with
  | Node(l, d, r) -> 
    (traverse2 l) @ [d] @ (traverse2 r)
  | Leaf(d) -> [d]

(* returns the proper order for the Pre-Order traversal (as a list) *)
(* TODO *)
let rec traverse2_pre = fun t -> match t with
  | Node(l, d, r) -> 
    [d] @ (traverse2 l) @ (traverse2 r)
  | Leaf(d) -> [d]

(* returns the proper order for the Post-Order traversal (as a list) *)
(* TODO *)
let rec traverse2_post = fun t -> match t with
  | Node(l, d, r) -> 
    (traverse2 l) @ (traverse2 r) @ [d]
  | Leaf(d) -> [d]

(*
this encodes the following tree:
  4
 / \
2   5
/ \
1   3
*)

let my_tree = Node(Node(Leaf(1),2,Leaf(3)),4,Leaf(5))
let v = traverse2 my_tree (* should produce the value List(1, 2, 3, 4, 5) *)

(**************************)
(** binary tree ADT tests *)
(**************************)

let tree_tests = ("Tree (In-order)", traverse2, (=), eq_exn, Some(str_tree,str_int_list), [
  (Some("basic example"), Node(Node(Leaf(1),2,Leaf(3)),4,Leaf(5)), Ok([1; 2; 3; 4; 5]))
])

let tree_tests_pre = ("Tree (Pre-order)", traverse2_pre, (=), eq_exn, Some(str_tree,str_int_list), [
  (* TODO - add your unit tests here *)
      (Some("Test1"), Node(Node(Leaf(1),2,Leaf(3)),4,Leaf(5)), Ok([4; 1; 2; 3; 5]));
    (Some("Test2"), Node(Node(Leaf(5),4,Leaf(3)),2,Leaf(1)), Ok([2; 5; 4; 3; 1]));
    (Some("Test3"), Node(Node(Leaf(1),5,Leaf(4)),3,Leaf(2)), Ok([3; 1; 5; 4; 2]));
    (Some("Test4"), Node(Node(Leaf(2),1,Leaf(5)),4,Leaf(3)), Ok([4; 2; 1; 5; 3]));
    (Some("Test5"), Node(Node(Leaf(3),2,Leaf(1)),5,Leaf(4)), Ok([5; 3; 2; 1; 4]))
])

let tree_tests_post = ("Tree (Post-order)", traverse2_post, (=), eq_exn, Some(str_tree,str_int_list), [
  (* TODO - add your unit tests here *)
         (Some("Test1"), Node(Node(Leaf(1),2,Leaf(3)),4,Leaf(5)), Ok([1; 2; 3; 5; 4]));
    (Some("Test2"), Node(Node(Leaf(5),4,Leaf(3)),2,Leaf(1)), Ok([5; 4; 3; 1; 2]));
    (Some("Test3"), Node(Node(Leaf(1),5,Leaf(4)),3,Leaf(2)), Ok([1; 5; 4; 2; 3]));
    (Some("Test4"), Node(Node(Leaf(2),1,Leaf(5)),4,Leaf(3)), Ok([2; 1; 5; 3; 4]));
    (Some("Test5"), Node(Node(Leaf(3),2,Leaf(1)),5,Leaf(4)), Ok([3; 2; 1; 4; 5]))
])


(******************)
(** sum function **)
(******************)

(*
  sum(-2) = 0
  sum(-1) = 0
  sum(0)  = 0
  sum(1)  = 2
  sum(2)  = 2 + 4
  sum(3)  = 2 + 4 + 8
  sum(4)  = 2 + 4 + 8 + 16 = 2*(1 + (2 + 4 + 8))
*)
(* TODO *)

let rec pow ((x : int ), ( y : int)) : int =
  match y with
     0 -> 1
    | _ -> 2 * pow(x,y-1)
   (* Helper func that has power functiality*) 
let rec sum (n : int) : int =
  match n with
     0 -> 0
    | _ -> pow(2, n) + sum(n-1) 

(***************)
(** sum tests **)
(***************)

let simple_sum_tests = ("Sum", sum, (=), eq_exn, Some(string_of_int,string_of_int), [
  (None, 1, Ok(2));
  (None, 2, Ok(6));
  (None, 3, Ok(14))
])

let sum_tests = ("Sum", sum, (=), eq_exn, Some(string_of_int,string_of_int), [
  (* TODO - add your unit tests here *)
  (None, 5, Ok(62));
  (None, 4, Ok(30));
  (None, 0, Ok(0));
  (None, 6, Ok(126));
  (None, 7, Ok(254))
])
