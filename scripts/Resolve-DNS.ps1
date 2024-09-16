if ($args.Length -ne 2) {
    Write-Host "Usage: .\Resolve-DNS.ps1 <network_prefix> <dns_server>"
    Write-Host "Example: .\Resolve-DNS.ps1 192.168.3 192.168.4.4"
    exit
}

$networkPrefix = $args[0]   # e.g., 192.168.3
$dnsServer = $args[1]       # e.g., 192.168.4.4

For ($i=1; $i -le 254; $i++) {
    $ip = "$networkPrefix.$i"
    
    $result = Resolve-DnsName -Name $ip -Server $dnsServer -ErrorAction SilentlyContinue
    
    if ($result) {
        Write-Host "IP: $ip -> Hostname: $($result.NameHost)"
    }
}
