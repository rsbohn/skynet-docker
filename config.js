module.exports={
  rateLimit: parseInt(process.env.RATELIMIT) || 10,
  port: process.env.PORT || 5000,
  log: true
}
