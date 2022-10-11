#include <stdio.h>
#include <stdlib.h>
#include <registryFunction.h>
#include <epicsExport.h>
#include <aSubRecord.h>

static long getConfig(aSubRecord *precord) {
  int info_size=0, i=0, j=0;
  FILE *file;
  char *backup = (char *)precord->vala;;
  
  file = fopen("/opt/epics-R3.16.2/heidenhain-nd780-epics-ioc/nd780App/src/backup.txt", "r");   
  while (fgetc(file)!=EOF)
    info_size++; //getting size of backup file
  fclose(file);

  char auxArray[info_size+1]; // force final null character

  file = fopen("/opt/epics-R3.16.2/heidenhain-nd780-epics-ioc/nd780App/src/backup.txt", "r");   
  fread(auxArray, info_size+1, 1, file);
  fclose(file);

  while(auxArray[i]!=0) //runs over auxArray untill final null character
    {
      if (auxArray[i] == '\\')
      {
        switch (auxArray[i+1])
        {
        case 'n':
          backup[j] = '\n';
          j++;  //moves to next backup index
          i+=2; //skips the next character (avoid writing 'n' to backup)
        break;
        case 'r':
          backup[j] = '\r';
          j++; 
          i+=2; 
        break;
        case 'x':
          backup[j] = '\x03';
          j++; 
          i+=4; //skips the 3 next characters (avoid writing 'x03' to backup)
        break;
        }
      }
      else
      {
        //writes anything that's not escaped and move the index ahead
        backup[j] = auxArray[i]; 
        i++;
        j++;
      }
    }
  return 0;
}

epicsRegisterFunction(getConfig);