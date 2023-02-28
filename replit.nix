{ pkgs }: {
    deps = [
        pkgs.busybox
        pkgs.bashInteractive
        pkgs.xray
        pkgs.dig
        pkgs.htop
        pkgs.dnsproxy
        pkgs.dogdns
    ];
}
