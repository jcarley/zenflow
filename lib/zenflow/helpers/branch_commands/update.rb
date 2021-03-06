module Zenflow
  module BranchCommands
    module Update

      def self.included(thor)
        thor.class_eval do

          desc "update", "Update the branch to the latest code"
          option :offline, type: :boolean, desc: "Runs in offline mode"
          def update
            branch_name
            Zenflow::Branch.update(branch(:source)) if !options[:offline]
            Zenflow::Branch.checkout("#{flow}/#{branch_name}")
            Zenflow::Branch.merge(branch(:source))
          end

        end
      end

    end
  end
end
