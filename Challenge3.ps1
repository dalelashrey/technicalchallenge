function Get-Value($object, $key) {
    $keys = $key -split '/'
    $value = $object

    foreach ($k in $keys) {
        if ($value.ContainsKey($k)) {
            $value = $value[$k]
        }
        else {
            return 'not a valid map'
        }
    }

    return $value
}