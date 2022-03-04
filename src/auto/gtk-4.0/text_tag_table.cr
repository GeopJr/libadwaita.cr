require "../g_object-2.0/object"
require "./buildable"

module Gtk
  # The collection of tags in a `GtkTextBuffer`
  #
  # You may wish to begin by reading the
  # [text widget conceptual overview](section-text-widget.html),
  # which gives an overview of all the objects and data types
  # related to the text widget and how they work together.
  #
  # # GtkTextTagTables as GtkBuildable
  #
  # The `GtkTextTagTable` implementation of the `GtkBuildable` interface
  # supports adding tags by specifying “tag” as the “type” attribute
  # of a <child> element.
  #
  # An example of a UI definition fragment specifying tags:
  # ```xml
  # <object class="GtkTextTagTable">
  #  <child type="tag">
  #    <object class="GtkTextTag"/>
  #  </child>
  # </object>
  # ```
  class TextTagTable < GObject::Object
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_text_tag_table_get_type
    end

    def initialize
      # gtk_text_tag_table_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_tag_table_new

      # Return value handling
      @pointer = _retval
    end

    def add(tag : Gtk::TextTag) : Bool
      # gtk_text_tag_table_add: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_tag_table_add(self, tag)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def foreach(func : Pointer(Void), data : Pointer(Void)?) : Nil
      # gtk_text_tag_table_foreach: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGtk.gtk_text_tag_table_foreach(self, func, data)

      # Return value handling
    end

    def size : Int32
      # gtk_text_tag_table_get_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_tag_table_get_size(self)

      # Return value handling
      _retval
    end

    def lookup(name : ::String) : Gtk::TextTag?
      # gtk_text_tag_table_lookup: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_tag_table_lookup(self, name)

      # Return value handling
      Gtk::TextTag.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def remove(tag : Gtk::TextTag) : Nil
      # gtk_text_tag_table_remove: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_tag_table_remove(self, tag)

      # Return value handling
    end

    struct TagAddedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "tag-added::#{@detail}" : "tag-added"
      end

      def connect(&block : Proc(Gtk::TextTag, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TextTag, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TextTag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextTag, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextTag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextTag, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextTagTable, Gtk::TextTag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextTagTable.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextTagTable, Gtk::TextTag, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextTagTable, Gtk::TextTag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextTagTable.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextTagTable, Gtk::TextTag, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(tag : Gtk::TextTag) : Nil
        LibGObject.g_signal_emit_by_name(@source, "tag-added", tag)
      end
    end

    def tag_added_signal
      TagAddedSignal.new(self)
    end

    struct TagChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "tag-changed::#{@detail}" : "tag-changed"
      end

      def connect(&block : Proc(Gtk::TextTag, Bool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TextTag, Bool, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TextTag, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::TextTag, Bool, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextTag, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::TextTag, Bool, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextTagTable, Gtk::TextTag, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::TextTagTable.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::TextTagTable, Gtk::TextTag, Bool, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextTagTable, Gtk::TextTag, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::TextTagTable.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::TextTagTable, Gtk::TextTag, Bool, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(tag : Gtk::TextTag, size_changed : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "tag-changed", tag, size_changed)
      end
    end

    def tag_changed_signal
      TagChangedSignal.new(self)
    end

    struct TagRemovedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "tag-removed::#{@detail}" : "tag-removed"
      end

      def connect(&block : Proc(Gtk::TextTag, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TextTag, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TextTag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextTag, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextTag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextTag, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextTagTable, Gtk::TextTag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextTagTable.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextTagTable, Gtk::TextTag, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextTagTable, Gtk::TextTag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextTagTable.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextTagTable, Gtk::TextTag, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(tag : Gtk::TextTag) : Nil
        LibGObject.g_signal_emit_by_name(@source, "tag-removed", tag)
      end
    end

    def tag_removed_signal
      TagRemovedSignal.new(self)
    end
  end
end
