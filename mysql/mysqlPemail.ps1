Function Run-MySQLQuery {
    Param(
        [Parameter(
            Mandatory = $true,
            ParameterSetName = '',
            ValueFromPipeline = $true)]
            [string]$query,
        [Parameter(
            Mandatory = $true,
            ParameterSetName = '',
            ValueFromPipeline = $true)]
            [string]$connectionString
        )
    Begin {
        Write-Verbose "Starting Begin Section"
    }
    Process {
        Write-Verbose "Starting Process Section"
        try {
            # Создаем коннект к базе
            Write-Verbose "Create Database Connection"
            # Можно так же использовать прямое обращение к dll 
#$mySQLDataDLL="C:\scripts\mysql\MySQL.Data.dll" 
    
#[void][system.reflection.Assembly]::LoadFrom($mySQLDataDLL)
            [void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
            $connection = New-Object MySql.Data.MySqlClient.MySqlConnection
            $connection.ConnectionString = $ConnectionString
            Write-Verbose "Open Database Connection"
            $connection.Open()
 
            #  Выполнение SQL запросов
            Write-Verbose "Run MySQL Querys"
            $command = New-Object MySql.Data.MySqlClient.MySqlCommand($query, $connection)
            $dataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter($command)
            $dataSet = New-Object System.Data.DataSet
            $recordCount = $dataAdapter.Fill($dataSet, "data")
            $dataSet.Tables["data"] | Format-Table
        }
        catch {
            Write-Host "Could not run MySQL Query" $Error[0]
        }
        Finally {
            Write-Verbose "Close Connection"
            $connection.Close()
        }
    }
    End {
        Write-Verbose "Starting End Section"
    }
}
Function Run-SendEmail {

param(
[string]$to,
[string]$subject,
[string]$body
)

$smtpServer = "co-exch.domain.local"
$smtpFrom = "notification@modis.ru"
$smtpTo = $to
$messageSubject = $subject
$messageBody = $body

$smtp = New-Object Net.Mail.SmtpClient($smtpServer)
$smtp.Send($smtpFrom,$smtpTo,$messagesubject,$messagebody)
}

$connstring = "Server=hostname;Uid=username;Pwd=Password;database=databasename;CharSet=utf8"
$SQLQuery = "select user from user"
$res = run-MySQLQuery -ConnectionString $connString -Query $SQLQuery | Out-String

Run-SendEmail -to "to@modis.ru" -subject "test" -body $res
