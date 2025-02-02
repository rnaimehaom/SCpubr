\donttest{
  # Check Suggests.
  value <- SCpubr:::check_suggests(function_name = "do_LigandReceptorPlot", passive = TRUE)

  if (isTRUE(value)){
    liana_output <- readRDS(system.file("extdata/liana_output_example.rds", package = "SCpubr"))
    # Ligand Receptor analysis plot.
    p <- SCpubr::do_LigandReceptorPlot(liana_output = liana_output)
    p

    # Ligand Receptor analysis plot with extra interactions.
    p <- SCpubr::do_LigandReceptorPlot(liana_output = liana_output,
                                       top_interactions = 50)
    p

    # Add missing LR combinations.
    p1 <- SCpubr::do_LigandReceptorPlot(liana_output = liana_output,
                                        add_missing_LR_combinations = TRUE)

    # Restrict the results to only the LR combinations that have a value.
    p2 <- SCpubr::do_LigandReceptorPlot(liana_output = liana_output,
                                        add_missing_LR_combinations = FALSE)
    p <- p1 /p2
    p

    # Ligand Receptor analysis plot with increased dot size.
    p <- SCpubr::do_LigandReceptorPlot(liana_output = liana_output,
                                       dot.size = 2)
    p

    # Ligand Receptor analysis plot with grid.
    p <- SCpubr::do_LigandReceptorPlot(liana_output = liana_output,
                                       grid.color = "steelblue")
    p

    # Ligand Receptor analysis plot with inverted axes.
    p <- SCpubr::do_LigandReceptorPlot(liana_output = liana_output,
                                       flip = TRUE,
                                       x_labels_angle = 90,
                                       rotate_strip_text = TRUE)
    p

    # Ligand Receptor analysis plot grouped by ligand.complex.
    p <- SCpubr::do_LigandReceptorPlot(liana_output = liana_output,
                                       plot.grid = TRUE,
                                       grid.color = "grey90",
                                       grid.type = "dotted",
                                       x_labels_angle = 90,
                                       rotate_strip_text = TRUE,
                                       split.by = "ligand.complex")
    p

    # Ligand Receptor analysis plot grouped by ligand.complex.
    p <- SCpubr::do_LigandReceptorPlot(liana_output = liana_output,
                                       split.by = "receptor.complex")
    p

    # Ligand Receptor analysis plot with inverted axes with filtered source and targets.
    p <- SCpubr::do_LigandReceptorPlot(liana_output = liana_output,
                                       flip = FALSE,
                                       keep_source = c("0", "3", "9"),
                                       keep_target = c("3", "4", "9"))
    p

    # Chord diagram of the total significant interactions from each cluster and all the rest.
    out <- SCpubr::do_LigandReceptorPlot(liana_output = liana_output,
                                         top_interactions = 25,
                                         compute_ChordDiagrams = TRUE)
    out$chord_total_interactions

    # Chord diagram of the total ligand-receptor interactions from each cluster and all the rest.
    out$chord_ligand_receptor

    # Chord diagram of the total significant interactions from each cluster and all the rest.
    out <- SCpubr::do_LigandReceptorPlot(liana_output = liana_output,
                                         top_interactions = 25,
                                         keep_source = c("0", "7"),
                                         compute_ChordDiagrams = TRUE)
    out$chord_total_interactions

    # Chord diagram of the total ligand-receptor interactions from each cluster and all the rest.
    out$chord_ligand_receptor
  } else if (isFALSE(value)){
    message("This function can not be used without its suggested packages.")
    message("Check out which ones are needed using `SCpubr::state_dependencies()`.")
  }
}

