import tinyredis.redis,
       std.stdio
    ;

/**
 * This is simple console to demonstrate Tiny Redis
 */
void main() 
{
    auto redis = new Redis();
    
    char[] buf; 
    
    write("redis > "); 
    while (stdin.readln(buf))
    {
        if(buf[0 .. $-1] == "exit") 
            return;
        
        if(buf.length > 0)
            try{
                auto resp = redis.send(cast(string)buf);
                writeln(resp.toDiagnosticString());
                
            }catch(RedisResponseException e)
            {
                writeln("(error) ", e.msg);
            }
        
        write("redis > ");  
    }
}