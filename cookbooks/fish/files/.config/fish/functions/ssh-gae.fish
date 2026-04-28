function ssh-gae
    set -l project $argv[1]
    set -l service $argv[2]

    if test (count $argv) -lt 2
        echo "Usage: ssh-gae <project_id> <service_name>"
        return 1
    end

    echo "Fetching latest instance info for $service..."

    set -l instance_info (gcloud --project $project --format json app instances list --service $service --sort-by="~instance.startTime" | jq -r '.[0] | "\(.id) \(.version)"')

    set -l parts (string split " " $instance_info)
    set -l instance_id $parts[1]
    set -l version_id $parts[2]

    if test -z "$instance_id" -o "$instance_id" = "null"
        echo "Error: No instances found for service '$service'."
        return 1
    end

    echo "Connecting to Instance: $instance_id (Version: $version_id)..."

    gcloud --project $project app instances ssh $instance_id --service $service --version $version_id --container gaeapp
end
