How To Build Header Only Boost
=====

Couple of scripts to build true header only Boost libraries.
Tested with Ubuntu 16.04 and Boost 1.69.0.

The main idea is to use Boost BCP tool on every library to find out if it produces 'src' folders in dependencies.
We don't want extra dependencies so will remove everything except 'src' in 'libs' (examples, docs).

## Prepare
Download and unpack Boost and remove everything unneeded.

```
./prepare.sh
```

## List
Prepare lists of libraries to extraction. Runs bcp on every library and collects dependencies.

Produces *header_only_libraries.txt* and *all_libraries.txt* (with dependencies).

```
./list.sh
```

<details><summary>expand</summary>
<p>

```
accumulators 23M
align 868K
any 1.6M
array 680K
assert 612K
assign 9.1M
bind 920K
callable_traits 368K
circular_buffer 2.7M
compatibility 132K
concept_check 2.2M
config 716K
container_hash 1.4M
conversion 20K
convert 36M
core 736K
crc 888K
detail 11M
disjoint_sets 44K
dynamic_bitset 9.6M
endian 1.7M
foreach 8.1M
format 4.2M
function 8.9M
functional 16M
function_types 10M
fusion 32M
hana 20M
heap 9.9M
hof 504K
integer 748K
intrusive 3.3M
io 636K
iterator 16M
lambda 7.6M
lexical_cast 12M
local_function 9.7M
logic 664K
metaparse 12M
move 1.2M
mp11 180K
mpl 11M
msm 30M
multi_array 8.8M
multi_index 12M
optional 3.4M
parameter_python 20K
phoenix 41M
poly_collection 17M
polygon 2.1M
pool 1.7M
predef 672K
preprocessor 3.4M
property_tree 14M
proto 21M
ptr_container 12M
qvm 3.9M
ratio 7.8M
rational 1.5M
safe_numerics 2.7M
scope_exit 9.0M
signals2 12M
smart_ptr 2.6M
sort 4.4M
static_assert 620K
throw_exception 640K
tokenizer 8.0M
tti 11M
tuple 924K
type_index 3.2M
typeof 7.2M
type_traits 2.0M
units 18M
unordered 4.2M
utility 3.4M
uuid 12M
variant 9.7M
vmd 2.9M
winapi 1.3M
xpressive 26M
yap 3.0M
```

</p>
</details>

## Extract
Run bcp to get final distributive.

```
./extract.sh
```

## Result
For those who are lazy here is the resulting bcp command line for the latest version (1.69):

```
bcp \
accumulators \
align \
any \
array \
assert \
assign \
bind \
callable_traits \
circular_buffer \
compatibility \
concept_check \
config \
container_hash \
conversion \
convert \
core \
crc \
detail \
disjoint_sets \
dynamic_bitset \
endian \
foreach \
format \
function \
functional \
function_types \
fusion \
hana \
heap \
hof \
integer \
intrusive \
io \
iterator \
lambda \
lexical_cast \
local_function \
logic \
metaparse \
move \
mp11 \
mpl \
msm \
multi_array \
multi_index \
optional \
parameter_python \
phoenix \
poly_collection \
polygon \
pool \
predef \
preprocessor \
property_tree \
proto \
ptr_container \
qvm \
ratio \
rational \
safe_numerics \
scope_exit \
signals2 \
smart_ptr \
sort \
static_assert \
throw_exception \
tokenizer \
tti \
tuple \
type_index \
typeof \
type_traits \
units \
unordered \
utility \
uuid \
variant \
vmd \
winapi \
xpressive \
yap \
/tmp/boost
```

## Perl Package
There is a Perl package which contains some of the listed libraries:
* https://metacpan.org/pod/CPP::Boost::Mini

## Archive
* [Boost 1.68.0](archive/1_68_0/README.md)
* [Boost 1.69.0](archive/1_69_0/README.md)

## References
* https://www.boost.org/doc/libs/1_69_0/tools/bcp/doc/html/index.html
* https://www.boost.org/doc/libs/1_69_0/more/getting_started/unix-variants.html#header-only-libraries
* https://steveire.wordpress.com/2016/08/21/boost-dependencies-and-bcp/
* https://www.boost.org/doc/libs
* https://unix.stackexchange.com/questions/158234/tool-in-unix-to-subtract-text-files

