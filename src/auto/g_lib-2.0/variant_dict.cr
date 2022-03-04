module GLib
  # #GVariantDict is a mutable interface to #GVariant dictionaries.
  #
  # It can be used for doing a sequence of dictionary lookups in an
  # efficient way on an existing #GVariant dictionary or it can be used
  # to construct new dictionaries with a hashtable-like interface.  It
  # can also be used for taking existing dictionaries and modifying them
  # in order to create new ones.
  #
  # #GVariantDict can only be used with %G_VARIANT_TYPE_VARDICT
  # dictionaries.
  #
  # It is possible to use #GVariantDict allocated on the stack or on the
  # heap.  When using a stack-allocated #GVariantDict, you begin with a
  # call to g_variant_dict_init() and free the resources with a call to
  # g_variant_dict_clear().
  #
  # Heap-allocated #GVariantDict follows normal refcounting rules: you
  # allocate it with g_variant_dict_new() and use g_variant_dict_ref()
  # and g_variant_dict_unref().
  #
  # g_variant_dict_end() is used to convert the #GVariantDict back into a
  # dictionary-type #GVariant.  When used with stack-allocated instances,
  # this also implicitly frees all associated memory, but for
  # heap-allocated instances, you must still call g_variant_dict_unref()
  # afterwards.
  #
  # You will typically want to use a heap-allocated #GVariantDict when
  # you expose it as part of an API.  For most other uses, the
  # stack-allocated form will be more convenient.
  #
  # Consider the following two examples that do the same thing in each
  # style: take an existing dictionary and look up the "count" uint32
  # key, adding 1 to it if it is found, or returning an error if the
  # key is not found.  Each returns the new dictionary as a floating
  # #GVariant.
  #
  # ## Using a stack-allocated GVariantDict
  #
  # |[<!-- language="C" -->
  #   GVariant *
  #   add_to_count (GVariant  *orig,
  #                 GError   **error)
  #   {
  #     GVariantDict dict;
  #     guint32 count;
  #
  #     g_variant_dict_init (&dict, orig);
  #     if (!g_variant_dict_lookup (&dict, "count", "u", &count))
  #       {
  #         g_set_error (...);
  #         g_variant_dict_clear (&dict);
  #         return NULL;
  #       }
  #
  #     g_variant_dict_insert (&dict, "count", "u", count + 1);
  #
  #     return g_variant_dict_end (&dict);
  #   }
  # ]|
  #
  # ## Using heap-allocated GVariantDict
  #
  # |[<!-- language="C" -->
  #   GVariant *
  #   add_to_count (GVariant  *orig,
  #                 GError   **error)
  #   {
  #     GVariantDict *dict;
  #     GVariant *result;
  #     guint32 count;
  #
  #     dict = g_variant_dict_new (orig);
  #
  #     if (g_variant_dict_lookup (dict, "count", "u", &count))
  #       {
  #         g_variant_dict_insert (dict, "count", "u", count + 1);
  #         result = g_variant_dict_end (dict);
  #       }
  #     else
  #       {
  #         g_set_error (...);
  #         result = NULL;
  #       }
  #
  #     g_variant_dict_unref (dict);
  #
  #     return result;
  #   }
  # ]|
  class VariantDict
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(VariantDict.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(VariantDict.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_variant_dict_get_type
    end

    def initialize(from_asv : _?)
      # g_variant_dict_new: (Constructor)
      # @from_asv: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      from_asv = if from_asv.nil?
                   Pointer(Void).null
                 else
                   from_asv.to_unsafe
                 end
      from_asv = GLib::Variant.new(from_asv) unless from_asv.is_a?(GLib::Variant)

      # C call
      _retval = LibGLib.g_variant_dict_new(from_asv)

      # Return value handling
      @pointer = _retval
    end

    def clear : Nil
      # g_variant_dict_clear: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_variant_dict_clear(self)

      # Return value handling
    end

    def contains(key : ::String) : Bool
      # g_variant_dict_contains: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_variant_dict_contains(self, key)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def _end : GLib::Variant
      # g_variant_dict_end: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_variant_dict_end(self)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::None)
    end

    def insert_value(key : ::String, value : _) : Nil
      # g_variant_dict_insert_value: (Method)
      # Returns: (transfer none)

      # Handle parameters
      value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)

      # C call
      LibGLib.g_variant_dict_insert_value(self, key, value)

      # Return value handling
    end

    def lookup_value(key : ::String, expected_type : GLib::VariantType?) : GLib::Variant
      # g_variant_dict_lookup_value: (Method)
      # @expected_type: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      expected_type = if expected_type.nil?
                        Pointer(Void).null
                      else
                        expected_type.to_unsafe
                      end

      # C call
      _retval = LibGLib.g_variant_dict_lookup_value(self, key, expected_type)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    def ref : GLib::VariantDict
      # g_variant_dict_ref: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGLib.g_variant_dict_ref(self)

      # Return value handling
      GLib::VariantDict.new(_retval, GICrystal::Transfer::Full)
    end

    def remove(key : ::String) : Bool
      # g_variant_dict_remove: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_variant_dict_remove(self, key)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def unref : Nil
      # g_variant_dict_unref: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_variant_dict_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
