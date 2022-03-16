#!/bin/bash
echo '随便输'`
read value
case "${value}" in
    1)
        echo "item = 1"
    ;;
    2|3)
        echo "item = 2 or item = 3"
    ;;
    *)
        echo "default (none of above)"
    ;;
esac
