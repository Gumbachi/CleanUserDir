# Clean User Directory  

Run the script and provide a valid directory and it will hide all dot files and folders that are listed in the `$NonDotFiles` array  
  
These Include:  

- Contacts
- Favorites  
- Links  
- Saved Games  
- Searches  
- Music  
- Videos  

Feel free to add more to this list by adding to the array  

## Example

```shell
./cmuda.ps1 C:\Users\Gumbachi
```

You may need to run  
`Set-ExecutionPolicy Unrestricted`
