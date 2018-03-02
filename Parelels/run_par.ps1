       workflow Test-Workflow #($array)
        {           
           $array = "C:\1","G:\2","M:\3"
           ForEach -Parallel ($job in $array)
           {
               Parallel
               {
                  robocopy.exe "G:\distr\" $job data3.bin /Z /J /MT 30 /log+:$job"\log.log"
               }
           }
        }

        Test-Workflow 