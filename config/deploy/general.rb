namespace :staging do
  task :deploy_all do
    run_locally do
      info   "deploying app1:staging"
      system "cap app1:staging deploy"

      info   "deploying app2:staging"
      system "cap app2:staging deploy"

    end
  end
end
