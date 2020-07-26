import os
import json
import net.http
import lib.vargs
import term
import lib

struct Plug {
   version string
   author string
   lite_path string
   plugins string
}

fn main(){
   mut args := vargs.new(os.args, 1)
   args.parse()
   json_file := os.read_file("conf2.json") or {println("error: \nfailed to read the file") return }
   decoded:=json.decode(Plug,json_file) or {
      println(term.red('error: \nfailed to open or parse the \' conf.json\' file'))
      return
   }
   plugins_array :=decoded.plugins.split(",")

   match args.command
   {
      //i encountered a little problem importing this from utils.v so, i decided to let it as it is.
   "get"{   
      if args.options['p'] in plugins_array{
         req:=http.get("https://raw.githubusercontent.com/rxi/lite-plugins/master/plugins/"+args.options['p']+".lua") or {
            println(term.bold(term.red("error: \nfailed to connect to the enpoint, check that your connection is open")))
            return
            }
         mut fi:= os.create(decoded.lite_path+"data/plugins/"+args.options['p']+'.lua') or {
            println("failed to create "+decoded.lite_path+"data/plugins/"+args.options['p']+'.lua')
            return 
            }
         fi.write(req.text) 
         print(req.text)
            }
      else{
         println(term.bold(term.red("Error:\nPackage not found,")))
         lib.help()
        }
      }
   "list"{
         lib.list_plugins(plugins_array)
      }
   "search"{
         lib.search(args.options['p'],plugins_array)
      }
   "help"{
         lib.help()
      }
else{
   println(term.bold(term.red("error: \nCommand not found")))
   lib.help()
      }
   }
}