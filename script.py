"""
Скрипт, который запускает omniNames,
компилирует IDL
"""
import subprocess
import os.path
import fnmatch
import os

if __name__=='__main__':
    OmniOrbDir = os.path.normpath(r"C:\Users\IVANOFF\omniORB-4.2.3\bin\x86_win32")
    env = os.environ
    env['PATH']=env['PATH']+";"+r"C:\Python38"
    env['PATH']=env['PATH']+";"+OmniOrbDir
    try:
        idlFiles=[]
        for file in os.listdir('.'):
            if fnmatch.fnmatch(file, '*.idl'):
                idlFiles.append(file)
        args=["omniidl","-bcxx","-Wbtp"]+idlFiles
        process=subprocess.run(args,env=env,check=True)

        omniNamesprocess = subprocess.Popen(['omniNames','-start','-always'], env=env)
    except subprocess.CalledProcessError as e:
        print("Error! Couldn't compile IDL file!")

    else:
        print("Easy!")
        print('IDL Compiler:',process.returncode)

