#! /bin/bash

echo "Project URL (e.g. php.example.com):"
read url

if ! [ -f ".env" ]; then
    cp "env.example" ".env"
    sed -i -e "s/\(PROJECT_URL=php.example.com\)/PROJECT_URL=$url/g" ".env"
    echo "Created .env file."
else
    echo ".env already exists, skipping..."
fi

sed -i -e "s/\(server_name php.example.com;\)/server_name $url;/g" "site.conf"
echo "Updated site.conf file."