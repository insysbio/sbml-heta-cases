#= 
    This code was generated by heta-compiler of v0.5.9
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    S2 = 2.0
    S3 = 1.5
    S4 = 4.0
    C = 0.5
    k1 = 0.75
    S1 = 1.5
    reaction1 = C * k1 * S1
    S3_proc = 0.5 * k1
    k2 = 0.25
    S4_proc = (-0.5) * k2
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
            S3 * C,
            S4 * C,
        ],
        
        [
            C,
            k1,
            k2,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,k1,k2,) = p.static
    (S1_,S2_,S3_,S4_,) = u 

    # Heta rules
    S2 = S2_ / C
    S3 = S3_ / C
    S4 = S4_ / C
    S1 = S1_ / C
    reaction1 = C * k1 * S1
    S3_proc = 0.5 * k1
    S4_proc = (-0.5) * k2
    
    #p.static .= [C,k1,k2,]
    du .= [
      -reaction1,  # dS1_/dt
      reaction1,  # dS2_/dt
      S3_proc*C,  # dS3_/dt
      S4_proc*C,  # dS4_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,k1,k2,) = integrator.p.static
        (S1_,S2_,S3_,S4_,) = u

        # Heta rules
        S2 = S2_ / C
        S3 = S3_ / C
        S4 = S4_ / C
        S1 = S1_ / C
        reaction1 = C * k1 * S1
        S3_proc = 0.5 * k1
        S4_proc = (-0.5) * k2
        
        # calculate amounts
        C_ = C
        reaction1_ = reaction1
        k1_ = k1
        k2_ = k2
        S3_proc_ = S3_proc
        S4_proc_ = S4_proc

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events

### continous events

### event assignments


### OUTPUT ###

x00709 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00709 = x00709
)
tasks = ()

export models, tasks

end
