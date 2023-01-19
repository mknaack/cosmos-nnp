FROM ocaml/opam:debian-11-ocaml-4.14-nnpchecker@sha256:7bcef2347ced204f0191620817e609b7fe18c86d2e7e8b095a794a2e4d3c7208

RUN sudo apt -y install libgmp-dev pkg-config libssl-dev

WORKDIR /home/opam

RUN opam install cohttp-lwt-unix lwt_ssl

ADD --chown=opam . .

ENTRYPOINT eval $(opam env) && dune exec cosmos_nnp