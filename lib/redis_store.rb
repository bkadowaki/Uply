module RedisStore
  
  def set(key, value)
    redis.set(key, value)
  end
  
  def get(key)
    redis.get(key)
  end
  
  def hget(hash, field)
    redis.hget(hash,field)
  end 

  def hmget(hash, *field)
    redis.hmget(hash, *field)
  end
  
  def hgetall(hash)
    redis.hgetall(hash)
  end

  private
  
  def redis
    $redis
  end
end
