FROM rust:slim-trixie

RUN <<EOF
apt update
apt install -y libclang-dev gcc-arm-none-eabi
cargo install flip-link cargo-make cargo-binutils
EOF

WORKDIR /usr/src/myapp

CMD cargo build --release && cargo make uf2 --release