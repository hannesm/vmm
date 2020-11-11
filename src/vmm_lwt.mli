(* (c) 2018 Hannes Mehnert, all rights reserved *)

val pp_sockaddr : Format.formatter -> Lwt_unix.sockaddr -> unit

val server_socket : bool -> Vmm_core.service -> Lwt_unix.file_descr Lwt.t

val connect : Lwt_unix.socket_domain -> Lwt_unix.sockaddr -> Lwt_unix.file_descr option Lwt.t

val pp_process_status : Format.formatter -> Unix.process_status -> unit

val ret : Unix.process_status -> Vmm_core.process_exit

val waitpid : int -> (int * Lwt_unix.process_status, unit) result Lwt.t

val wait_and_clear : int -> Vmm_core.process_exit Lwt.t

val read_wire : Lwt_unix.file_descr ->
  (Vmm_commands.wire, [> `Eof | `Exception | `Toomuch ]) result Lwt.t

val write_raw :
  Lwt_unix.file_descr -> bytes -> (unit, [> `Exception ]) result Lwt.t

val write_wire :
  Lwt_unix.file_descr -> Vmm_commands.wire -> (unit, [> `Exception ]) result Lwt.t

val safe_close : Lwt_unix.file_descr -> unit Lwt.t

val read_from_file : string -> Cstruct.t Lwt.t
