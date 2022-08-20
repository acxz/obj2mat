# obj2mat
Octave/Matlab function to parse
[Wavefront OBJ](https://en.wikipedia.org/wiki/Wavefront_.obj_file) data into a
[Matlab MAT](https://www.mathworks.com/help/matlab/import_export/mat-file-versions.html)
file.

## Dependencies
- Octave or Matlab
  - [Octave Download Page](https://www.gnu.org/software/octave/download.html)
  - [Matlab Store Page](https://www.mathworks.com/store?s_tid=gn_store)

## Usage
`obj2mat.m` is just a function that requires the filepath of an input `.obj`
file and outputs a corresponding `.mat` file containing a `obj` struct including
the OBJ properties.

```
octave:1> obj2mat("example.obj")
obj_filename = example.obj
Parsing...
Saved
mat_filename = example.mat
octave:2> load("example.mat")
octave:3> fieldnames(obj)
ans =
{
  [1,1] = v
  [2,1] = vn
}
```

Supported properties are `v`, `vn`. Note, the full OBJ format is not supported,
PRs are welcome!
