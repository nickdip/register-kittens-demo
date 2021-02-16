# PaaS
paas_app_environment             = "qa"
env_config                       = "qa"
paas_space_name                  = "bat-qa"
paas_postgres_service_plan       = "tiny-unencrypted-11"
paas_redis_service_plan          = "tiny-4_x"
paas_app_start_timeout           = "180"
paas_web_app_instances           = 1
paas_web_app_memory              = 512
paas_worker_app_instances        = 1
paas_worker_app_memory           = 512
paas_worker_app_stopped          = false

statuscake_alerts = {

  alert = {
    website_name   = "register-qa"
    website_url    = "https://qa.register-trainee-teachers.education.gov.uk/ping"
    test_type      = "HTTP"
    check_rate     = 60
    contact_group  = [188603]
    trigger_rate   = 0
    node_locations = ["UKD", "DE", "CA"]
    paused = false
  }
}
