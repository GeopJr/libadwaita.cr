module GLib
  # This section introduces the GVariant type system. It is based, in
  # large part, on the D-Bus type system, with two major changes and
  # some minor lifting of restrictions. The
  # [D-Bus specification](http://dbus.freedesktop.org/doc/dbus-specification.html),
  # therefore, provides a significant amount of
  # information that is useful when working with GVariant.
  #
  # The first major change with respect to the D-Bus type system is the
  # introduction of maybe (or "nullable") types.  Any type in GVariant can be
  # converted to a maybe type, in which case, "nothing" (or "null") becomes a
  # valid value.  Maybe types have been added by introducing the
  # character "m" to type strings.
  #
  # The second major change is that the GVariant type system supports the
  # concept of "indefinite types" -- types that are less specific than
  # the normal types found in D-Bus.  For example, it is possible to speak
  # of "an array of any type" in GVariant, where the D-Bus type system
  # would require you to speak of "an array of integers" or "an array of
  # strings".  Indefinite types have been added by introducing the
  # characters "*", "?" and "r" to type strings.
  #
  # Finally, all arbitrary restrictions relating to the complexity of
  # types are lifted along with the restriction that dictionary entries
  # may only appear nested inside of arrays.
  #
  # Just as in D-Bus, GVariant types are described with strings ("type
  # strings").  Subject to the differences mentioned above, these strings
  # are of the same form as those found in D-Bus.  Note, however: D-Bus
  # always works in terms of messages and therefore individual type
  # strings appear nowhere in its interface.  Instead, "signatures"
  # are a concatenation of the strings of the type of each argument in a
  # message.  GVariant deals with single values directly so GVariant type
  # strings always describe the type of exactly one value.  This means
  # that a D-Bus signature string is generally not a valid GVariant type
  # string -- except in the case that it is the signature of a message
  # containing exactly one argument.
  #
  # An indefinite type is similar in spirit to what may be called an
  # abstract type in other type systems.  No value can exist that has an
  # indefinite type as its type, but values can exist that have types
  # that are subtypes of indefinite types.  That is to say,
  # g_variant_get_type() will never return an indefinite type, but
  # calling g_variant_is_of_type() with an indefinite type may return
  # %TRUE.  For example, you cannot have a value that represents "an
  # array of no particular type", but you can have an "array of integers"
  # which certainly matches the type of "an array of no particular type",
  # since "array of integers" is a subtype of "array of no particular
  # type".
  #
  # This is similar to how instances of abstract classes may not
  # directly exist in other type systems, but instances of their
  # non-abstract subtypes may.  For example, in GTK, no object that has
  # the type of #GtkBin can exist (since #GtkBin is an abstract class),
  # but a #GtkWindow can certainly be instantiated, and you would say
  # that the #GtkWindow is a #GtkBin (since #GtkWindow is a subclass of
  # #GtkBin).
  #
  # ## GVariant Type Strings
  #
  # A GVariant type string can be any of the following:
  #
  # - any basic type string (listed below)
  #
  # - "v", "r" or "*"
  #
  # - one of the characters 'a' or 'm', followed by another type string
  #
  # - the character '(', followed by a concatenation of zero or more other
  #   type strings, followed by the character ')'
  #
  # - the character '{', followed by a basic type string (see below),
  #   followed by another type string, followed by the character '}'
  #
  # A basic type string describes a basic type (as per
  # g_variant_type_is_basic()) and is always a single character in length.
  # The valid basic type strings are "b", "y", "n", "q", "i", "u", "x", "t",
  # "h", "d", "s", "o", "g" and "?".
  #
  # The above definition is recursive to arbitrary depth. "aaaaai" and
  # "(ui(nq((y)))s)" are both valid type strings, as is
  # "a(aa(ui)(qna{ya(yd)}))". In order to not hit memory limits, #GVariant
  # imposes a limit on recursion depth of 65 nested containers. This is the
  # limit in the D-Bus specification (64) plus one to allow a #GDBusMessage to
  # be nested in a top-level tuple.
  #
  # The meaning of each of the characters is as follows:
  # - `b`: the type string of %G_VARIANT_TYPE_BOOLEAN; a boolean value.
  # - `y`: the type string of %G_VARIANT_TYPE_BYTE; a byte.
  # - `n`: the type string of %G_VARIANT_TYPE_INT16; a signed 16 bit integer.
  # - `q`: the type string of %G_VARIANT_TYPE_UINT16; an unsigned 16 bit integer.
  # - `i`: the type string of %G_VARIANT_TYPE_INT32; a signed 32 bit integer.
  # - `u`: the type string of %G_VARIANT_TYPE_UINT32; an unsigned 32 bit integer.
  # - `x`: the type string of %G_VARIANT_TYPE_INT64; a signed 64 bit integer.
  # - `t`: the type string of %G_VARIANT_TYPE_UINT64; an unsigned 64 bit integer.
  # - `h`: the type string of %G_VARIANT_TYPE_HANDLE; a signed 32 bit value
  #   that, by convention, is used as an index into an array of file
  #   descriptors that are sent alongside a D-Bus message.
  # - `d`: the type string of %G_VARIANT_TYPE_DOUBLE; a double precision
  #   floating point value.
  # - `s`: the type string of %G_VARIANT_TYPE_STRING; a string.
  # - `o`: the type string of %G_VARIANT_TYPE_OBJECT_PATH; a string in the form
  #   of a D-Bus object path.
  # - `g`: the type string of %G_VARIANT_TYPE_SIGNATURE; a string in the form of
  #   a D-Bus type signature.
  # - `?`: the type string of %G_VARIANT_TYPE_BASIC; an indefinite type that
  #   is a supertype of any of the basic types.
  # - `v`: the type string of %G_VARIANT_TYPE_VARIANT; a container type that
  #   contain any other type of value.
  # - `a`: used as a prefix on another type string to mean an array of that
  #   type; the type string "ai", for example, is the type of an array of
  #   signed 32-bit integers.
  # - `m`: used as a prefix on another type string to mean a "maybe", or
  #   "nullable", version of that type; the type string "ms", for example,
  #   is the type of a value that maybe contains a string, or maybe contains
  #   nothing.
  # - `()`: used to enclose zero or more other concatenated type strings to
  #   create a tuple type; the type string "(is)", for example, is the type of
  #   a pair of an integer and a string.
  # - `r`: the type string of %G_VARIANT_TYPE_TUPLE; an indefinite type that is
  #   a supertype of any tuple type, regardless of the number of items.
  # - `{}`: used to enclose a basic type string concatenated with another type
  #   string to create a dictionary entry type, which usually appears inside of
  #   an array to form a dictionary; the type string "a{sd}", for example, is
  #   the type of a dictionary that maps strings to double precision floating
  #   point values.
  #
  #   The first type (the basic type) is the key type and the second type is
  #   the value type. The reason that the first type is restricted to being a
  #   basic type is so that it can easily be hashed.
  # - `*`: the type string of %G_VARIANT_TYPE_ANY; the indefinite type that is
  #   a supertype of all types.  Note that, as with all type strings, this
  #   character represents exactly one type. It cannot be used inside of tuples
  #   to mean "any number of items".
  #
  # Any type string of a container that contains an indefinite type is,
  # itself, an indefinite type. For example, the type string "a*"
  # (corresponding to %G_VARIANT_TYPE_ARRAY) is an indefinite type
  # that is a supertype of every array type. "(*s)" is a supertype
  # of all tuples that contain exactly two items where the second
  # item is a string.
  #
  # "a{?*}" is an indefinite type that is a supertype of all arrays
  # containing dictionary entries where the key is any basic type and
  # the value is any type at all.  This is, by definition, a dictionary,
  # so this type string corresponds to %G_VARIANT_TYPE_DICTIONARY. Note
  # that, due to the restriction that the key of a dictionary entry must
  # be a basic type, "{**}" is not a valid type string.
  class VariantType
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(VariantType.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(VariantType.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGLib::VariantType)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_variant_type_get_gtype
    end

    def initialize(type_string : ::String)
      # g_variant_type_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_variant_type_new(type_string)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    def self.new_array(element : GLib::VariantType) : self
      # g_variant_type_new_array: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_variant_type_new_array(element)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_dict_entry(key : GLib::VariantType, value : GLib::VariantType) : self
      # g_variant_type_new_dict_entry: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_variant_type_new_dict_entry(key, value)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_maybe(element : GLib::VariantType) : self
      # g_variant_type_new_maybe: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_variant_type_new_maybe(element)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_tuple(items : Enumerable(GLib::VariantType)) : self
      # g_variant_type_new_tuple: (Constructor)
      # @items: (array length=length element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      length = items.size # Generator::ArrayArgPlan
      items = items.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGLib.g_variant_type_new_tuple(items, length)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_tuple(*items : GLib::VariantType)
      self.new_tuple(items)
    end

    def copy : GLib::VariantType
      # g_variant_type_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_variant_type_copy(@pointer)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::Full)
    end

    def dup_string : ::String
      # g_variant_type_dup_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_variant_type_dup_string(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def element : GLib::VariantType
      # g_variant_type_element: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_element(@pointer)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::None)
    end

    def equal(type2 : GLib::VariantType) : Bool
      # g_variant_type_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_equal(@pointer, type2)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def first : GLib::VariantType
      # g_variant_type_first: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_first(@pointer)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::None)
    end

    def free : Nil
      # g_variant_type_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_variant_type_free(@pointer)

      # Return value handling
    end

    def string_length : UInt64
      # g_variant_type_get_string_length: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_get_string_length(@pointer)

      # Return value handling

      _retval
    end

    def hash : UInt32
      # g_variant_type_hash: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_hash(@pointer)

      # Return value handling

      _retval
    end

    def is_array : Bool
      # g_variant_type_is_array: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_is_array(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_basic : Bool
      # g_variant_type_is_basic: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_is_basic(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_container : Bool
      # g_variant_type_is_container: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_is_container(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_definite : Bool
      # g_variant_type_is_definite: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_is_definite(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_dict_entry : Bool
      # g_variant_type_is_dict_entry: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_is_dict_entry(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_maybe : Bool
      # g_variant_type_is_maybe: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_is_maybe(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_subtype_of(supertype : GLib::VariantType) : Bool
      # g_variant_type_is_subtype_of: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_is_subtype_of(@pointer, supertype)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_tuple : Bool
      # g_variant_type_is_tuple: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_is_tuple(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_variant : Bool
      # g_variant_type_is_variant: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_is_variant(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def key : GLib::VariantType
      # g_variant_type_key: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_key(@pointer)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::None)
    end

    def n_items : UInt64
      # g_variant_type_n_items: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_n_items(@pointer)

      # Return value handling

      _retval
    end

    def _next : GLib::VariantType
      # g_variant_type_next: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_next(@pointer)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::None)
    end

    def value : GLib::VariantType
      # g_variant_type_value: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_value(@pointer)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::None)
    end

    def self.checked_(arg0 : ::String) : GLib::VariantType
      # g_variant_type_checked_: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_checked_(arg0)

      # Return value handling

      GLib::VariantType.new(_retval, GICrystal::Transfer::None)
    end

    def self.string_get_depth_(type_string : ::String) : UInt64
      # g_variant_type_string_get_depth_: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_string_get_depth_(type_string)

      # Return value handling

      _retval
    end

    def self.string_is_valid(type_string : ::String) : Bool
      # g_variant_type_string_is_valid: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_variant_type_string_is_valid(type_string)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def self.string_scan(string : ::String, limit : ::String?) : Bool
      # g_variant_type_string_scan: (None)
      # @limit: (nullable)
      # @endptr: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      limit = if limit.nil?
                Pointer(LibC::Char).null
              else
                limit.to_unsafe
              end
      # Generator::OutArgUsedInReturnPlan
      endptr = Pointer(Pointer(LibC::Char)).null
      # C call
      _retval = LibGLib.g_variant_type_string_scan(string, limit, endptr)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
