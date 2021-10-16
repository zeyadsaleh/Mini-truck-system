# README

### Installing
1. Download the zipped file and unzip it or Clone it
		```
	 	https://github.com/zeyadsaleh/Mini-truck-system.git
		```
2. cd inside the project
    ```sh
    cd Mini-truck-system
    ```
3.  Run this command to install all gems we used
    ```sh
    bundle install
    ```
4. run this command to create your database
    ```sh
    rake db:create db:migrate
    ```
6. run the sidekiq task
    ```sh
    sidekiq ./app/workers/truck_report_worker.rb
    ```
7. Start your server
    ```sh
    rails server
    ```
8. Open your browser on this url ``` http://localhost:3000```

### Installing via docker
1. docker build
	```
	docker build .
	```
2. docker-cpmpose up
    ```sh
    docker-cpmpose up
    ```

