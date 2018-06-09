How To Build Header Only Boost
=====

Couple of scripts to build true header only Boost libraries.
Tested with Ubuntu 16.04 and Boost 1.67.0.

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

## Extract
Run bcp to get final distributive.

```
./extract.sh
```

## Result
For those who are lazy here is the resulting bcp command line:

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
geometry \
gil \
hana \
heap \
hof \
icl \
integer \
interprocess \
intrusive \
io \
iterator \
lambda \
lexical_cast \
locale \
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
phoenix \
poly_collection \
polygon \
predef \
preprocessor \
property_tree \
proto \
ptr_container \
qvm \
ratio \
rational \
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
/tmp/boost
```

## References
* https://www.boost.org/doc/libs/1_67_0/tools/bcp/doc/html/index.html
* https://www.boost.org/doc/libs/1_67_0/more/getting_started/unix-variants.html#header-only-libraries
* https://steveire.wordpress.com/2016/08/21/boost-dependencies-and-bcp/
* https://www.boost.org/doc/libs
* https://unix.stackexchange.com/questions/158234/tool-in-unix-to-subtract-text-files

