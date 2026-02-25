Get-Process |

Where-Object CPU -gt 100 |

Select-Object Name, CPU, Id |

Export-Csv "C:\Users\cgasp\OneDrive\Documents\PowerShell_lab\high_cpu.csv" -NoTypeInformation
 