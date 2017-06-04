ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Points de distribution" do
          table do
            DistributionPoint.all.map do |point|
              tr do
                td point.name
                td link_to("Feuille Excel", export_distribution_point_path(point, format: :xlsx))
              end
            end
          end
        end
      end

      column do
        panel "Informations - Bienvenue" do
          para "Bienvenue dans le panel d'administration. Vous pouvez gérer toutes " \
               "les ressources du site depuis cet endroit (ajout d'utilisateur, de " \
               "nouveaux produits, etc.)."
          para
          para "Vous pouvez également exporter les feuilles Excel associés aux" \
               "différents points de distributions. Lorsqu'un utilisateur met à " \
               "jour sa commande hebdomadaire, la feuille associée est " \
               "automatiquement mise à jour ; aucune intervention de votre part " \
               "n'est requise."
        end
      end
    end
  end
end
