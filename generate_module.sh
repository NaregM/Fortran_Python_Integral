
LDFLAGS=-shared 
rm *~ *.so *.o
f2py3 -m simps_2d -c simps_2d.f90
echo "Module created successfully!"

