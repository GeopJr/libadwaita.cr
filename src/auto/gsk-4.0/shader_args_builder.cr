module Gsk
  # An object to build the uniforms data for a `GskGLShader`.
  class ShaderArgsBuilder
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(ShaderArgsBuilder.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(ShaderArgsBuilder.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGsk::ShaderArgsBuilder)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_shader_args_builder_get_type
    end

    def initialize(shader : Gsk::GLShader, initial_values : GLib::Bytes?)
      # gsk_shader_args_builder_new: (Constructor)
      # @initial_values: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      initial_values = if initial_values.nil?
                         Pointer(Void).null
                       else
                         initial_values.to_unsafe
                       end

      # C call
      _retval = LibGsk.gsk_shader_args_builder_new(shader, initial_values)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    def ref : Gsk::ShaderArgsBuilder
      # gsk_shader_args_builder_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_shader_args_builder_ref(self)

      # Return value handling

      Gsk::ShaderArgsBuilder.new(_retval, GICrystal::Transfer::Full)
    end

    def set_bool(idx : Int32, value : Bool) : Nil
      # gsk_shader_args_builder_set_bool: (Method)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_shader_args_builder_set_bool(self, idx, value)

      # Return value handling
    end

    def set_float(idx : Int32, value : Float32) : Nil
      # gsk_shader_args_builder_set_float: (Method)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_shader_args_builder_set_float(self, idx, value)

      # Return value handling
    end

    def set_int(idx : Int32, value : Int32) : Nil
      # gsk_shader_args_builder_set_int: (Method)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_shader_args_builder_set_int(self, idx, value)

      # Return value handling
    end

    def set_uint(idx : Int32, value : UInt32) : Nil
      # gsk_shader_args_builder_set_uint: (Method)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_shader_args_builder_set_uint(self, idx, value)

      # Return value handling
    end

    def set_vec2(idx : Int32, value : Graphene::Vec2) : Nil
      # gsk_shader_args_builder_set_vec2: (Method)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_shader_args_builder_set_vec2(self, idx, value)

      # Return value handling
    end

    def set_vec3(idx : Int32, value : Graphene::Vec3) : Nil
      # gsk_shader_args_builder_set_vec3: (Method)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_shader_args_builder_set_vec3(self, idx, value)

      # Return value handling
    end

    def set_vec4(idx : Int32, value : Graphene::Vec4) : Nil
      # gsk_shader_args_builder_set_vec4: (Method)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_shader_args_builder_set_vec4(self, idx, value)

      # Return value handling
    end

    def to_args : GLib::Bytes
      # gsk_shader_args_builder_to_args: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_shader_args_builder_to_args(self)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # gsk_shader_args_builder_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_shader_args_builder_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
