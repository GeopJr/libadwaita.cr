module GObject
  # A #GParamSpecPool maintains a collection of #GParamSpecs which can be
  # quickly accessed by owner and name.
  #
  # The implementation of the #GObject property system uses such a pool to
  # store the #GParamSpecs of the properties all object types.
  class ParamSpecPool
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = pointer
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::ParamSpecPool)).zero?
    end

    def insert(pspec : GObject::ParamSpec, owner_type : UInt64) : Nil
      # g_param_spec_pool_insert: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_param_spec_pool_insert(self, pspec, owner_type)

      # Return value handling
    end

    def list_owned(owner_type : UInt64) : GLib::List
      # g_param_spec_pool_list_owned: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGObject.g_param_spec_pool_list_owned(self, owner_type)

      # Return value handling

      GLib::List(GObject::ParamSpec).new(_retval, GICrystal::Transfer::Container)
    end

    def lookup(param_name : ::String, owner_type : UInt64, walk_ancestors : Bool) : GObject::ParamSpec?
      # g_param_spec_pool_lookup: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_param_spec_pool_lookup(self, param_name, owner_type, walk_ancestors)

      # Return value handling

      GObject::ParamSpec.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def remove(pspec : GObject::ParamSpec) : Nil
      # g_param_spec_pool_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_param_spec_pool_remove(self, pspec)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
